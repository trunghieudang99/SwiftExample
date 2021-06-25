//
//  ParameterSaleView.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 23/06/2021.
//

import UIKit

class ParameterSaleView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius  = 5
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    lazy var coverColorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.remark1
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue, weight: .bold)
        return label
    }()
    
    let centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis         = .vertical
        stackView.alignment    = .fill
        stackView.distribution = .fill
        stackView.spacing       = 0
        return stackView
    }()
    
    convenience init(_ flashSale: FlashSaleModel) {
        self.init()
        self.createTitleView(flashSale.pramaters)
        self.configData(flashSale.type)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutContainerView()
        layoutCoverColorView()
        layoutTitleLabel()
        layoutCenterStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configData(_ type: FlashType) {
        self.titleLabel.text                = type.name
        self.coverColorView.backgroundColor = type.color
    }
    
    private func layoutContainerView() {
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func layoutCoverColorView() {
        addSubview(coverColorView)
        coverColorView.snp.makeConstraints { (make) in
            make.width.equalTo(16)
            make.height.equalToSuperview()
            make.top.left.equalToSuperview()
        }
    }
    
    private func layoutTitleLabel() {
        coverColorView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerX
                .centerY
                .equalToSuperview()
        }
    }
    
    private func layoutCenterStackView() {
        containerView.addSubview(centerStackView)
        centerStackView.snp.makeConstraints { (make) in
            make.left
                .equalToSuperview()
                .offset(16)
            make.top
                .bottom
                .right
                .equalToSuperview()
        }
    }
    
    private func createTitleView(_ params: [ParameterSale]) {
        for param in params {
            let view = TitleLabelView(param.title,
                                      param.money,
                                      param.unit)
            self.centerStackView.addArrangedSubview(view)
            view.snp.makeConstraints { (make) in
                make.height.equalTo(40)
            }
        }
    }
}
