//
//  Utils.swift
//  PokemonInfo
//
//  Created by Yura Chudnovets on 11/9/18.
//  Copyright © 2018 TFM. All rights reserved.
//

import UIKit

struct Utils {
    
    static func getLeftRightPadding() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let leftPadding = window?.safeAreaInsets.left
            let rightPadding = window?.safeAreaInsets.right
            return (leftPadding ?? 0) + (rightPadding ?? 0)
        } else {
            return 0
        }
    }
    
}
