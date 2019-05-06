//
//  UIScreen+Extensions.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/5.
//  Copyright © 2019 何旭. All rights reserved.
//

import Foundation

extension UIScreen {
    static var ex_screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
 
    static var ex_screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static var ex_scale: CGFloat {
        return UIScreen.main.scale
    }
    
}
