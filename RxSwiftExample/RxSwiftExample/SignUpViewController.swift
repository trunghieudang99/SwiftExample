//
//  SignUpViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit

class SignUpViewController: BaseViewController {

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
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = dimension.normalMargin
        return stackView
    }()
    
    let userIdTextFieldView: BaseTextFieldView = {
        let view = BaseTextFieldView(
            title: TextManager.driverId,
            placeholder: TextManager.driverIdPlaceHolder,
            type: .email
        )
        view.textField
        return view
    }()
    
    let passwordTextFieldView: BaseTextFieldView = {
        let view = BaseTextFieldView(
            title: TextManager.password,
            placeholder: TextManager.passwordPlaceHolder,
            type: .password
        )
        return view
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.login, for: .normal)
        button.layer.cornerRadius  = 5
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.primary1
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layoutBackgroundImageView(imageName: "splash_screen")
        layoutCenterStackView()
        layoutUserIdTextFieldView()
        layoutPasswordTextFieldView()
    }

}

// MARK: - Layout

extension SignUpViewController {
    
    private func layoutCenterStackView() {
        view.addSubview(centerStackView)
        centerStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
                .offset(dimension.normalMargin)
            make.trailing.equalToSuperview()
                .inset(dimension.normalMargin)
            make.centerY.equalToSuperview()
                .offset(-dimension.normalMargin)
        }
    }
    
    private func layoutUserIdTextFieldView() {
        centerStackView.addArrangedSubview(userIdTextFieldView)
    }
    
    private func layoutPasswordTextFieldView() {
        centerStackView.addArrangedSubview(passwordTextFieldView)
    }
}

