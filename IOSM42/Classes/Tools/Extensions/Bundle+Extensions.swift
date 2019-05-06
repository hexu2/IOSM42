//
//  Bundle+Extensions.swift
//  MOBL42
//
//  Created by 何旭 on 2019/5/4.
//  Copyright © 2019 何旭. All rights reserved.
//

import Foundation

extension Bundle {
    
    //返回命名空间字符串
    static var namespace: String {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
