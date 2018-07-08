//
//  UIColorExtentions.swift
//  CUIKit
//
//  Created by EmadHejazian on 7/24/17.
//  Copyright © 2017 Developersian. All rights reserved.
//

import UIKit

//Hex to UIColor
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

//let color = UIColor(hex: "ff0000")

