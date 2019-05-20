//
//  FTNavigationViewController.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/3.
//  Copyright © 2019 何旭. All rights reserved.
//

import UIKit

class FTNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
    }
    
    
    
    /// 重写pushViewController 让跳转时hidesBottomBarWhenPushed
    ///
    /// - Parameters:
    ///   - viewController: <#viewController description#>
    ///   - animated: <#animated description#>
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        print(viewController)
        //判断：不是栈底才需要隐藏，根控制器不需要隐
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true            
        }
        //判断：控制器类型
        if let vc = viewController as? FTBaseViewController {
            var title: String = "返回"
            //判断控制器级数
            if children.count == 1{
                title = children.first?.title ?? "返回"
            }
            
            vc.naviItem.leftBarButtonItem = UIBarButtonItem.init(title: title, fontSize: UIFont.systemFontSize, target: self, action: #selector(popToPare), isBack: true)
        }
        
        super.pushViewController(viewController, animated: animated)
        
    }
    
    // 返回上一级控制器
    @objc private func popToPare() {
//        print("返回。。。。")
        popViewController(animated: true)
    }

}
