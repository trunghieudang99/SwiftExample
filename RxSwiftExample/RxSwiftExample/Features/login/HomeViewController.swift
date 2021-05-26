//
//  HomeViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 18/05/2021.
//

import UIKit

class HomeViewController: BaseViewController {

    let scrollView: BaseScrollView = {
        let scrollView = BaseScrollView(frame: .zero)
        return scrollView
    }()
    
    let headerBackgroundView: BaseView = {
        let view = BaseView()
        view.backgroundColor = UIColor.primary1
        return view
    }()
    
    lazy var headerView: HomeHeaderView = {
        let view = HomeHeaderView(frame: .zero)
                
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.setupScrollView()
        self.setupHeaderBackgroundView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
        
    private func setupScrollView() {
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
        }
    }
    
    private func setupHeaderBackgroundView() {
        self.scrollView.view.addSubview(self.headerBackgroundView)
        self.headerBackgroundView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalTo(self.view)
        }
    }
}

