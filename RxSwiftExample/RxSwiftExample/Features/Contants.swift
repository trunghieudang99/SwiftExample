//
//  Contants.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 06/12/2021.
//

//import UIKit
//
//struct Font {
//
//    enum FontType {
//        case installed(FontName)
//        case custom(String)
//        case system
//        case systemBold
//        case systemItatic
//        case systemWeighted(weight: Double)
//        case monoSpacedDigit(size: Double, weight: Double)
//    }
//    enum FontSize {
//        case standard(StandardSize)
//        case custom(Double)
//        var value: Double {
//            switch self {
//            case .standard(let size):
//                return size.rawValue
//            case .custom(let customSize):
//                return customSize
//            }
//        }
//    }
//    enum FontName: String {
//        case RobotoBlack            = "Roboto-Black"
//        case RobotoBlackItalic      = "Roboto-BlackItalic"
//        case RobotoBold             = "Roboto-Bold"
//        case RobotoBoldItalic       = "Roboto-BoldItalic"
//        case RobotoItalic           = "Roboto-Italic"
//        case RobotoLight            = "Roboto_Light"
//        case RobotoLightItalic      = "Roboto-LightItalic"
//        case RobotoMedium           = "Roboto-Medium"
//        case RobotoMediumItalic     = "Roboto-MediumItalic"
//        case RobotoRegular          = "Roboto-Regular"
//        case RobotoThin             = "Roboto-Thin"
//        case RobotoThinItalic       = "Roboto-ThinItalic"
//    }
//    enum StandardSize: Double {
//        case h1 = 20.0
//        case h2 = 18.0
//        case h3 = 16.0
//        case h4 = 14.0
//        case h5 = 12.0
//        case h6 = 10.0
//    }
//
//    
//    var type: FontType
//    var size: FontSize
//    init(_ type: FontType, size: FontSize) {
//        self.type = type
//        self.size = size
//    }
//}
//
//extension Font {
//    
//    var instance: UIFont {
//        
//        var instanceFont: UIFont!
//        switch type {
//        case .custom(let fontName):
//            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
//                fatalError("\(fontName) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
//            }
//            instanceFont = font
//        case .installed(let fontName):
//            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
//                fatalError("\(fontName.rawValue) font is not installed, make sure it added in Info.plist and logged with Utility.logAllAvailableFonts()")
//            }
//            instanceFont = font
//        case .system:
//            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))
//        case .systemBold:
//            instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))
//        case .systemItatic:
//            instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))
//        case .systemWeighted(let weight):
//            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
//                                             weight: UIFont.Weight(rawValue: CGFloat(weight)) ?? <#default value#>)
//        case .monoSpacedDigit(let size, let weight):
//            instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
//                                                            weight: CGFloat(weight))
//        }
//        return instanceFont
//    }
//}
//
//class Utility {
//    /// Logs all available fonts from iOS SDK and installed custom font
//    class func logAllAvailableFonts() {
//        for family in UIFont.familyNames {
//            print("\(family)")
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print("   \(name)")
//            }
//        }
//    }
//}
