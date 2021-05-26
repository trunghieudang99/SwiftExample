//
//  BaseScrollView.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 24/05/2021.
//

import UIKit

class BaseScrollView: UIScrollView {

    // MARK: - Define Components
    public let view: UIView = UIView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupComponents()
    }
    
    // MARK: - Setup UI
    func setupComponents() {
        self.backgroundColor = .background2
        self.addSubview(self.view)
        
        self.view.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        self.view.backgroundColor = .clear
    }
}
