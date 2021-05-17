//
//  Dimension.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit

let dimension = Dimension.shared

class Dimension {
    static let shared = Dimension()
    
    var widthScreen:    CGFloat = 1.0
    var heightScreen:   CGFloat = 1.0
    var widthScale:     CGFloat = 1.0
    var heightScale:    CGFloat = 1.0
    
    private init() {
        self.widthScale   = UIScreen.main.bounds.width / 375
        self.heightScale  = UIScreen.main.bounds.height / 667
        self.widthScreen  = UIScreen.main.bounds.width
        self.heightScreen = UIScreen.main.bounds.height
        
        if self.widthScreen >= 2.0 {
            self.widthScale /= 1.4
            self.heightScale /= 1.4
        }
    }
    
    // MARK: Spacing
    var smallMargin: CGFloat {
        return (4 * self.widthScale).rounded()
    }

    var mediumMargin: CGFloat {
        return (8 * self.widthScale).rounded()
    }
   
    var mediumMargin_10: CGFloat {
        return (12 * self.widthScale).rounded()
    }
    
    var mediumMargin_12: CGFloat {
        return (12 * self.widthScale).rounded()
    }
    
    var normalMargin: CGFloat {
        return (16 * self.widthScale).rounded()
    }
    
    var normalMargin_20: CGFloat {
        return 20 * self.widthScale
    }

    var largeMargin: CGFloat {
        return (24 * self.widthScale).rounded()
    }
    
    var largeMargin_32: CGFloat {
        return (32 * self.widthScale).rounded()
    }
    
    var largeMargin_38: CGFloat {
        return (38 * self.widthScale).rounded()
    }
    
    var largeMargin_40: CGFloat {
        return (40 * self.widthScale).rounded()
    }
    
    var largeMargin_42: CGFloat {
        return (40 * self.widthScale).rounded()
    }
    
    var largeMargin_48: CGFloat {
        return (48 * self.widthScale).rounded()
    }
    
    var largeMargin_56: CGFloat {
        return (56 * self.widthScale).rounded()
    }
    
    var largeMargin_60: CGFloat {
        return (60 * self.widthScale).rounded()
    }

    var largeMargin_80: CGFloat {
        return (80 * self.widthScale).rounded()
    }
    
    var largeMargin_90: CGFloat {
        return (90 * self.widthScale).rounded()
    }

    var largeMargin_96: CGFloat {
        return (96 * self.widthScale).rounded()
    }
    
    var largeMargin_120: CGFloat {
        return (120 * self.widthScale).rounded()
    }
    
    var largeMargin_150: CGFloat {
        return (150 * self.widthScale).rounded()
    }

    // MARK: - Default
    var defaultHeightButton: CGFloat {
        return (48 * dimension.widthScale).rounded()
    }
    
    var checkBoxHeight: CGFloat {
        return 26
    }
}
