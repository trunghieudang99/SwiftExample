//
//  UIFont+Extension.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit

enum FontSize: CGFloat {
    case special_32 = 32.0
    case special_30 = 30.0
    case special_28 = 28.0
    case special_24 = 24.0
    case hero = 20.0
    case h1 = 16.0
    case h2 = 14.0
    case h3 = 12.0
    
    case title = 18.0
    case body = 10.0
    case paragraph = 8.0
}

extension UIFont {
    func width(for string: String, constrainedToHeight height: CGFloat) -> CGFloat {
        return NSString(string: string).boundingRect(with: CGSize(width: .greatestFiniteMagnitude, height: height),
                                                     options: .usesLineFragmentOrigin,
                                                     attributes: [NSAttributedString.Key.font: self],
                                                     context: nil).size.width
    }
}
