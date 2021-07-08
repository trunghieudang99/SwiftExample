//
//  BaseViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    // MARK: - Define Components
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // MARK: - Define Variables
    let disposeBag = DisposeBag()
    var hideTabBar: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background2
        self.setupComponents()
        self.setupHideKeyboardOnTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = self.hideTabBar
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Support Methods
    func setupComponents() {
        // Where UI components will be layout
    }

}

// MARK: - Setup UI
extension BaseViewController {
    
    internal func setupBackgroundImageView(imageName: String, fullScreenEnable: Bool) {
        self.backgroundImageView.image = UIImage(named: imageName)
        self.view.addSubview(self.backgroundImageView)
        self.backgroundImageView.snp.makeConstraints { (make) in
            if fullScreenEnable {
                make.edges.equalToSuperview()
            } else {
                make.leading.trailing.equalToSuperview()
            }
        }
    }
}

extension BaseViewController: UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
}
