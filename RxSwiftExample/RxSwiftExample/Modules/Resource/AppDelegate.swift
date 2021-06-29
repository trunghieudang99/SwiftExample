//
//  AppDelegate.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Firebase
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())

        return true
    }
}

extension AppDelegate {
    
    func swichRootViewController(_ viewController: UIViewController,
                                 animated: Bool,
                                 duration: Double = 0.35,
                                 animationOption: UIView.AnimationOptions = .transitionCrossDissolve,
                                 completion: ((Bool) -> Void)? = nil)  {
        guard let window = self.window else { return }
        if animated {
            UIView.transition(with: window, duration: duration, options: animationOption, animations: {
                window.rootViewController = viewController
            }, completion: completion)
        } else {
            window.rootViewController = viewController
        }
    }
}
