//
//  TitleLabelView.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 23/06/2021.
//

import UIKit

class TitleLabelView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        return label
    }()
    
    lazy var priceUnitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        return label
    }()
    
    convenience init(_ title: String,
                     _ price: String?
                     ,_ unit: String) {
        self.init()
        self.titleLabel.text     = title
        self.priceLabel.text     = price ?? "* * *"
        self.priceUnitLabel.text = unit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutTitleLabel()
        layoutPriceUnitLabel()
        layoutPriceLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layoutTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left
                .equalToSuperview()
                .offset(dimension.normalMargin)
            make.top
                .equalToSuperview()
                .offset(dimension.normalMargin)
        }
    }
    
    private func layoutPriceUnitLabel() {
        addSubview(priceUnitLabel)
        priceUnitLabel.snp.makeConstraints { (make) in
            make.right
                .equalToSuperview()
                .inset(dimension.normalMargin)
            make.top
                .equalToSuperview()
                .offset(dimension.normalMargin)
        }
    }
    
    private func layoutPriceLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.right
                .equalTo(priceUnitLabel.snp.left)
                .offset(-dimension.smallMargin)
            make.top
                .equalToSuperview()
                .offset(dimension.normalMargin)
        }
    }
}
