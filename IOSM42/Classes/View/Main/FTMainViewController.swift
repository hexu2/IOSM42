//
//  FTMainViewController.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/3.
//  Copyright © 2019 何旭. All rights reserved.
//

import UIKit
import Alamofire

/// 主控制器
class FTMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupChildControllers()
        setupComposeButton()
        
    }
    
    
    /// 设置设备方向
    // portrait 竖
    // landscape 横
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    //设置私有控件
    private lazy var composeButton: UIButton = UIButton.ex_imageButton(imageName: "tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    // 发布按钮监听方法
    //@objc 允许函数在运行时通过OC的消息机制被调用
    @objc private func composeStauts(){
        print("发布动态")
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.ex_randomColor()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
}


// 相近的功能的函数，放在extension中便于维护,使用extension 切分代码块
//设置界面
extension FTMainViewController {
    
    //设置发布按钮
    private func setupComposeButton(){
        tabBar.addSubview(composeButton)
        //设置按钮位置
        let count =  CGFloat(self.children.count)
        // -1 是向内缩进的宽度减少，让按钮宽度变大，盖住容错点，避免白板
        let w = tabBar.bounds.width / count - 1
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)//dy 正数向内缩进负数向外缩进
        
        //发布按钮监听
        composeButton.addTarget(self, action: #selector(composeStauts), for: UIControl.Event.touchUpInside)
    }
    
    
    /// 设置所有子控制器
    private func setupChildControllers(){
        let array = [
            ["classname":"FTHomeViewController","title":"首页","imageName":"home"],
            ["classname":"FTMessageViewController","title":"消息","imageName":"message_center"],
            ["classname":"UIViewController"],
            ["classname":"FTDiscoverViewController","title":"发现","imageName":"discover"],
            ["classname":"FTProfileViewController","title":"我","imageName":"profile"]
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        self.viewControllers = arrayM
    }
    
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典 [classname, title, imageName]
    /// - Returns: 子控制器
    private func controller(dict:[String:String]) -> UIViewController{
        
        //1. 获取字典内容
        guard let classname = dict["classname"],let title = dict["title"], let imageName = dict["imageName"], let cls = NSClassFromString(Bundle.namespace + "." + classname) as? UIViewController.Type else {
            
            return UIViewController()
        }
        
        //2. 创建视图控制器
        //Bundle.init().namespace + "." + classname
        let vc = cls.init()
        //设置titile
        vc.title = title
        
        //设置图片
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        //设置tabBar字体
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .highlighted)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: UIControl.State.init(rawValue: 0))
        
        let nav = FTNavigationViewController(rootViewController:vc)
        return nav
    }
}
