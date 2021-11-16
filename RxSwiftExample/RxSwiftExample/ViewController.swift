//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 16/11/2021.
//

import UIKit

class ViewController: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    fileprivate lazy var rewardsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "dineIn-menu-1")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutScrollView()
        layoutRewardsImageView()
    }
    
    private func layoutScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaInsets)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func layoutRewardsImageView() {
        scrollView.addSubview(rewardsImageView)
        rewardsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalTo(view)
            make.bottom.equalToSuperview()
                .offset(-5)
        }
    }
    
}
