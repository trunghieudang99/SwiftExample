//
//  HomeHeaderView.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 24/05/2021.
//

import UIKit

class HomeHeaderView: BaseView {

    let logoImageView: UIImageView = {
        let image = UIImage(named: "icon-logo-type-2")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
    override func initialize() {
        super.initialize()
    }
    
    private func setupLogoImageView() {
        self.addSubview(self.logoImageView)
        self.logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(dimension.largeMargin)
            make.height.equalTo(dimension.largeMargin_48)
            if let image = self.logoImageView.image {
                make.width.equalTo(self.logoImageView.snp.height).multipliedBy(image.size.width / image.size.height)
            } else {
                make.width.equalTo(self.logoImageView.snp.height)
            }
        }
    }
    
}
