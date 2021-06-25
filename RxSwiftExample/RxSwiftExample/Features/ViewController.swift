//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 01/06/2021.
//

import UIKit

class ViewController: BaseViewController {

    fileprivate lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.tintColor = UIColor.white
        button.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "Trung Hieu"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layoutTestButton()
        layoutTestLabel()
    }
    
    @objc private func didTapNext() {
        let vc = ExampleViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    private func layoutTestButton() {
        view.addSubview(testButton)
        testButton.snp.makeConstraints { (make) in
//            $0.centerX
//                .centerY
//                .equalToSuperview()
//            $0.width.height.equalTo(100)
            make.centerX
                .centerY
                .equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    private func layoutTestLabel() {
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { (make) in
            make.centerX
                .equalToSuperview()
            make.width.height.equalTo(100)
            make.top.equalTo(testButton.snp.bottom)
                .offset(20)
        }
    }
    
}

