//
//  TextManager.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit

class TextManager: NSObject {
    static let dismissButtonTitle                           = "Dismiss"
    static let warningTitle                                 = "Warning"
    static let next                                         = "Next"
    static let noConnection                                 = "No connection. Please try again"
    static let unsuccessfully                               = "Unsuccessfully"
    static let goToSettings                                 = "Go to Settings"
    static let cancel                                       = "Cancel"
}


// MARK: - Startups

extension TextManager {
    static let driverId                                     = "Driver ID"
    static let driverIdPlaceHolder                          = "ID which you got from company"
    static let password                                     = "Password"
    static let passwordPlaceHolder                          = "Password to sign in your account"
    static let login                                        = "Login"
    static let required                                     = "Required"
    
    static let qrCodeTitle                                  = "Please scan QR code to active your Bee Delivery"
    static let or                                           = "or"
    static let enterKeyManual                               = "Enter Key Manually"
    static let enterKey                                     = "Enter Key"
    
    static let invalidQRCode                                = "We can not find any store, please try again or contact support"
    static let askCameraPermisisonTitile                    = "Would like to Access the Camera"
    static let askCameraPermisisonMessage                   = "need to access your camera for scanning QR code"
}
