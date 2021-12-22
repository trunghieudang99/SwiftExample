//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 08/07/2021.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let rewardsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "reward")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        layouScrollView()
        layoutImageView()
    }
    
    private func layouScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom)
            }
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func layoutImageView() {
        scrollView.addSubview(rewardsImageView)
        rewardsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(view)
            make.height.lessThanOrEqualTo(self.rewardsImageView.snp.width).multipliedBy(2750 / 1040)
            make.bottom.equalToSuperview().offset(-50)
        }
    }
}
