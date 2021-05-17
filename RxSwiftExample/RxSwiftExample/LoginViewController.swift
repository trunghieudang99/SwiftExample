//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
    let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "inapp_logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor.clear
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = dimension.normalMargin
        return stackView
    }()
    
    let userIdTextFieldView: BaseTextFieldView = {
        let view = BaseTextFieldView(title: TextManager.driverId,
                                     placeholder: TextManager.driverIdPlaceHolder,
                                     type: .email)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

