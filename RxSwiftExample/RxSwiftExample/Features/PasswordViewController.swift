//
//  PasswordViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 25/06/2021.
//

import UIKit

protocol PasswordViewControllerDelegate: class {
    func backToRootView()
}

class PasswordViewController: BaseViewController {

    weak var delegate: PasswordViewControllerDelegate?
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Test", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(tapBackView),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "PW"
        self.view.backgroundColor = .white
        layoutBackButton()
    }
    
    @objc func tapBackView() {
        self.navigationController?.popViewControllerWithHandler {
            self.delegate?.backToRootView()
        }
    }
    
    private func layoutBackButton() {
        view.addSubview(backButton)
        backButton.snp.makeConstraints { (make) in
            make.centerX
                .centerY
                .equalToSuperview()
            make.width
                .height
                .equalTo(50)
        }
    }

}
