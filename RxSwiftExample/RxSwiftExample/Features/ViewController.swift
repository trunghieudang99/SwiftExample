//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 01/06/2021.
//

import UIKit

protocol ViewControllerDelegate: class {
    func backToCurrentVC()
}

class ViewController: BaseViewController {

    weak var delegate: ViewControllerDelegate?
    
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
        self.navigationItem.title = "View"
        view.backgroundColor = UIColor.white
        layoutTestButton()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let vc  = PasswordViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: PasswordViewControllerDelegate {
    func backToRootView() {
        self.dismiss(animated: true) {
            self.delegate?.backToCurrentVC()
        }
    }
}


extension UINavigationController {
    
    func popViewControllerWithHandler(completion: @escaping ()->()) {
          CATransaction.begin()
          CATransaction.setCompletionBlock(completion)
          self.popViewController(animated: true)
          CATransaction.commit()
      }
    
    func pushViewController(viewController: UIViewController, completion: @escaping ()->()) {
          CATransaction.begin()
          CATransaction.setCompletionBlock(completion)
          self.pushViewController(viewController, animated: true)
          CATransaction.commit()
      }
}
