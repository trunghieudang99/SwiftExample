//
//  FlashSaleModel.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 23/06/2021.
//

import UIKit

enum FlashType: Int {
    case budget = 0
    case actual = 1
    
    var name: String {
        switch self {
        case .budget:
            return "Budaget"
        case .actual:
            return "Actual"
        }
    }
    
    var color: UIColor {
        switch self {
        case .budget:
            return UIColor.remark1
        case .actual:
            return UIColor.remark2
        }
    }
}

class FlashSaleModel {
    var type: FlashType            = .budget
    var pramaters: [ParameterSale] = []
    
    init(type: FlashType, parametes: [ParameterSale] ) {
        self.type      = type
        self.pramaters = parametes
    }
}

class ParameterSale {
    var title: String  = ""
    var money: String? = "* * *"
    var unit: String   = ""
    
    init(title: String, money: String, unit: String) {
        self.title = title
        self.money = money
        self.unit  = unit
    }
}

class ViewModel {
    
    var flashSaleModel: [FlashSaleModel] = []
    
    init() {
        
        let params1 = ParameterSale(title: "ALL", money: "125.000", unit: "千円")
        let params2 = ParameterSale(title: "CO", money: "48.000", unit: "千円")
        let params3 = ParameterSale(title: "FC", money: "* * *", unit: "千円")
        
        let actualModel  = FlashSaleModel(type: .actual, parametes: [params1, params2, params3])
        let budagetModel = FlashSaleModel(type: .budget, parametes: [params1, params2, params3])
        
        flashSaleModel = [actualModel, budagetModel]
    }
    
}


