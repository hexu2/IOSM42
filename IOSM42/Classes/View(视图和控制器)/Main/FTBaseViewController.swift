//
//  FTBaseViewController.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/3.
//  Copyright © 2019 何旭. All rights reserved.
//

import UIKit

class FTBaseViewController: UIViewController {
    
    //自定义导航条 -- test
    
//    lazy var navigationBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.ex_screenWidth, height: 64))
    lazy var navigationBar:UINavigationBar = SecondNavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.ex_screenWidth, height: 64))
    //自定义导航条目
    lazy var naviItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //重写title 的set 方法
    override var title: String?{
        didSet{
            naviItem.title = title
        }
    }
}

//设置界面
extension FTBaseViewController {
    
    @objc func setupUI(){
    
        view.backgroundColor = UIColor.ex_randomColor()
        
        //添加自定义导航条
        view.addSubview(navigationBar)
        navigationBar.items = [naviItem]
        
        //设置navbar 的渲染颜色
//        navigationBar.barTintColor = UIColor.ex_colorWithHex(rgbValue: 0xF6F6F6)
    }
    
}


//解决 ios11下的navigationBar上的UINavigationBarContentView的y上移到了0的位置 的问题
class SecondNavigationBar: UINavigationBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for subview in self.subviews {
            let stringFromClass = NSStringFromClass(subview.classForCoder)
            print("--------- \(stringFromClass)")
            if stringFromClass.contains("BarBackground") {
                subview.frame = self.bounds
            } else if stringFromClass.contains("UINavigationBarContentView") {
                subview.frame = CGRect(x: 0, y: 20, width: UIScreen.ex_screenWidth, height: 44)
            }
        }
    }
}
