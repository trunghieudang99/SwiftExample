//
//  ExampleViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 15/06/2021.
//

import UIKit

class ExampleViewController: BaseViewController {
    
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("Test", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(tapOnTest),
                         for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "ExampleView"
        layoutTestButton()
    }
    
    private func layoutTestButton() {
        view.addSubview(testButton)
        testButton.snp.makeConstraints { (make) in
            make.centerX
                .centerY
                .equalToSuperview()
            make.width
                .height
                .equalTo(50)
        }
    }
    
    @objc func tapOnTest() {
        let vc  = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
}

extension ExampleViewController: ViewControllerDelegate {
    func backToCurrentVC() {
        print("aaaa")
    }
}
