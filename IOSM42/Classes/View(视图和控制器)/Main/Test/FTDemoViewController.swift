//
//  FTDemoViewController.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/4.
//  Copyright © 2019 何旭. All rights reserved.
//

import UIKit

class FTDemoViewController: FTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "第\(navigationController?.children.count ?? 0)个"
    }

    @objc func showNext(){
        
        let vc = FTDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension FTDemoViewController{
    
    override func setupUI() {
        super.setupUI()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一页", style: .plain, target: self, action: #selector(showNext))
        
        let btn = UIButton.ex_textButton(title: "下一页", fontSize: UIFont.systemFontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(self, action: #selector(showNext), for: UIControl.Event.touchUpInside)
        naviItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
    }
}
