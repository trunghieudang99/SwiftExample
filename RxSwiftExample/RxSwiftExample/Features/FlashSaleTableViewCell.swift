//
//  FlashSaleTableViewCell.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 23/06/2021.
//

import UIKit

class FlashSaleTableViewCell: BaseTableViewCell {
    
    var viewModel = ViewModel()
    
    lazy var leftSaleView = ParameterSaleView()
    
    lazy var rightSaleView = ParameterSaleView()
    
    override func setupComponents() {
        createViewSale()
        layoutViewParamter1()
        layoutViewParamter2()
    }
    
    func configCell(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    private func createViewSale() {
        for model in viewModel.flashSaleModel {
            if model.type == .budget {
                self.leftSaleView = ParameterSaleView(model)
            } else {
                self.rightSaleView = ParameterSaleView(model)
            }
        }
    }
    
    private func layoutViewParamter1() {
        addSubview(leftSaleView)
        leftSaleView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.width.equalTo( (UIScreen.main.bounds.width - 16 * 3) / 2)
            make.top.bottom.equalToSuperview()
        }
    }
    
    private func layoutViewParamter2() {
        addSubview(rightSaleView)
        rightSaleView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.width.equalTo( (UIScreen.main.bounds.width - 16 * 3) / 2)
            make.top.bottom.equalToSuperview()
        }
    }
}
