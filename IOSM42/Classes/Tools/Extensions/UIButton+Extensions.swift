//
//  UIButton+Extensions.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/4.
//  Copyright © 2019 何旭. All rights reserved.
//

import Foundation

extension UIButton {
    
    /// 获取图片UIButton
    ///
    /// - Parameters:
    ///   - imageName: imageName description
    ///   - backgroundImageName: backgroundImageName description
    /// - Returns: return value description
    static func ex_imageButton (imageName: String, backgroundImageName: String ) -> UIButton{
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: UIControl.State.normal)
        let imageNameHL = imageName + "_highlighted"
        btn.setImage(UIImage(named: imageNameHL), for: UIControl.State.highlighted)
        
        btn.setBackgroundImage(UIImage(named: backgroundImageName), for: UIControl.State.normal)
        let backgroundImageNameHL = backgroundImageName + "_highlighted"
        btn.setBackgroundImage(UIImage(named: backgroundImageNameHL), for: UIControl.State.highlighted)
        btn.sizeToFit()
        
        return btn
    }
    
    
    /// ex_textButton with back ground image
    ///
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - fontSize: <#fontSize description#>
    ///   - normalColor: <#normalColor description#>
    ///   - highlightedColor: <#highlightedColor description#>
    ///   - backgroundImageName: <#backgroundImageName description#>
    /// - Returns: <#return value description#>
    static func ex_textButton(title: String, fontSize: CGFloat, normalColor: UIColor, highlightedColor: UIColor, backgroundImageName: String) -> UIButton{
        let btn:UIButton = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(normalColor, for: .normal)
        btn.setTitleColor(highlightedColor, for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        
        if !backgroundImageName.isEmpty {
            btn.setBackgroundImage(UIImage(named: backgroundImageName), for: UIControl.State.normal)
            let backgroundImageNameHL = backgroundImageName + "_highlighted"
            btn.setBackgroundImage(UIImage(named: backgroundImageNameHL), for: UIControl.State.highlighted)
            btn.sizeToFit()
        }
        return btn
    }
    
    
    ///ex_textButton without background image
    ///
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - fontSize: <#fontSize description#>
    ///   - normalColor: <#normalColor description#>
    ///   - highlightedColor: <#highlightedColor description#>
    /// - Returns: <#return value description#>
    static func ex_textButton(title: String, fontSize: CGFloat, normalColor: UIColor, highlightedColor: UIColor) -> UIButton {
        return ex_textButton(title: title, fontSize: fontSize, normalColor: normalColor, highlightedColor: highlightedColor, backgroundImageName: "")
    }
    
}
