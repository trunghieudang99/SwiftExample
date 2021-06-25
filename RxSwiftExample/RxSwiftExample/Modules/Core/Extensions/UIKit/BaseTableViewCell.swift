//
//  BaseTableViewCell.swift
//  CustomerApp
//
//  Created by Bee on 9/7/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class BaseTableViewCell: UITableViewCell, Reusable {
    
    let disposeBag = DisposeBag()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.selectionStyle = .none
        self.setupComponents()
    }
    
    // MARK: - Support Methods
    func setupComponents() {
    }
}
