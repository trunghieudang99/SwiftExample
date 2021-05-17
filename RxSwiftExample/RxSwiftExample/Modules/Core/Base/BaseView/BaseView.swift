//
//  BaseView.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit
import RxSwift

class BaseView: UIView {

    let disposeBag = DisposeBag()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {}

}
