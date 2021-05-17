//
//  UIColor+Extension.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit

import UIKit

// MARK: - App Color
extension UIColor {
    class var primary2: UIColor {
        return UIColor(hex: "#c8102e")
    }
    
    class var secondary1: UIColor {
        return UIColor(hex: "#313131")
    }
    
    class var background2: UIColor {
        return UIColor(hex: "#ffffff")
    }
    
    class var primary1: UIColor {
        return UIColor(hex: "#70a401")
    }
    
    class var background1: UIColor {
        return UIColor(hex: "#f5f7f9")
    }
    
    class var remark2: UIColor {
        return UIColor(hex: "#fdcf4b")
    }
    
    class var secondary4: UIColor {
        return UIColor(hex: "#f9f9f9")
    }
    
    class var secondary3: UIColor {
        return UIColor(hex: "#dfdfe3")
    }
    
    class var primary1Dark: UIColor {
        return UIColor(hex: "#4c6f00")
    }
    
    class var secondary2: UIColor {
        return UIColor(hex: "#78838c")
    }
    
    class var remark1: UIColor {
        return UIColor(hex: "#6092df")
    }
}

// MARK: - Support Method
extension UIColor {
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}
