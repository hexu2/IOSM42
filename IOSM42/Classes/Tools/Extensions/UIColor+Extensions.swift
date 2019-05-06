//
//  UIColor+Extensions.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/5.
//  Copyright © 2019 何旭. All rights reserved.
//

import Foundation

extension UIColor {

    static func ex_colorWithRed(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func ex_randomColor() -> UIColor {
        return ex_colorWithRed(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0)
    }
    
    static func ex_colorWithHex(rgbValue:Int) -> UIColor {
        return ex_colorWithHex(rgbValue:rgbValue, alpha: 1.0)
    }
    
    static func ex_colorWithHex(rgbValue:Int, alpha:CGFloat) -> UIColor {
        let r : CGFloat = (CGFloat)((rgbValue & 0xFF0000) >> 16) / 255.0
        let g : CGFloat = (CGFloat)((rgbValue & 0xFF00) >> 8) / 255.0
        let b : CGFloat  = (CGFloat)((rgbValue & 0xFF) ) / 255.0
        return UIColor.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
