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
    
    lazy var loginButton: BaseCornerRoundButton = {
        let button = BaseCornerRoundButton(title: TextManager.login)
        button.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] () in
            self?.login()
        }).disposed(by: self.disposeBag)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layoutBackgroundImageView(imageName: "splash_screen")
        layoutCenterStackView()
        layoutUserIdTextFieldView()
        layoutPasswordTextFieldView()
        layoutLoginButton()
        layoutTopView()
        layoutLogoImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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

    private func layoutLoginButton() {
        centerStackView.addArrangedSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.height.equalTo(dimension.largeMargin_56)
        }
    }
    
    private func layoutTopView() {
        view.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.bottom.equalTo(centerStackView.snp.top)
                .inset(dimension.largeMargin)
            make.left.right.equalToSuperview()
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
                    .offset(dimension.largeMargin)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
                    .offset(dimension.largeMargin)
            }
        }
    }
    
    private func layoutLogoImageView() {
        topView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view).multipliedBy(0.32)
            make.height.equalTo(self.logoImageView.snp.width)
        }
    }
}

extension SignUpViewController {
    
    fileprivate func login() {
        guard let code = self.userIdTextFieldView.text, !code.isEmpty else {
            self.userIdTextFieldView.showDefaultError()
            return
        }
        
        guard let password = self.passwordTextFieldView.text, !password.isEmpty else {
            self.passwordTextFieldView.showDefaultError()
            return
        }
        
    }
    
}

