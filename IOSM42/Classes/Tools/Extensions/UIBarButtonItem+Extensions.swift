//
//  UIBarButtonItem+Extensions.swift
//  IOSM42
//
//  Created by 何旭 on 2019/5/8.
//  Copyright © 2019 何旭. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    
    convenience init(title: String, fontSize: CGFloat, target: Any?, action: Selector, isBack: Bool = false) {
        
        let btn: UIButton = UIButton.ex_textButton(title: title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        if isBack {
            let imageName = "navigationbar_back_withtext"
            
            btn.setImage(UIImage(named: imageName), for: UIControl.State(rawValue: 0))
            btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
            
//            btn.sizeToFit()
        }
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: btn)
        
    }
    
}
