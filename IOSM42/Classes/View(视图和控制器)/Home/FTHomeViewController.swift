//
//  FTHomeViewContoller.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/3.
//  Copyright © 2019 何旭. All rights reserved.
//

import UIKit

class FTHomeViewController: FTBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func showFriends(){
        print("show friends...")
        let vc = FTDemoViewController()
//        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FTHomeViewController {
    override func setupUI() {
        super.setupUI()
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
        let btn = UIButton.ex_textButton(title: "好友", fontSize: UIFont.systemFontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(self, action: #selector(showFriends), for: UIControl.Event.touchUpInside)
        naviItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    }
}
