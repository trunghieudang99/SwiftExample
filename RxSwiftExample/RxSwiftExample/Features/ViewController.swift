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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
    }
    
}

//class Handler {
//
//    func handle() {
//        let data = requestDataToAPI()
//        let array = pareseResponse(data: data)
//        saveToDatabase(array: array)
//    }
//
//    private func requestDataToAPI() -> Data {
//
//    }
//
//    private func pareseResponse(data: Data) -> [String] {
//
//    }
//
//    private func saveToDatabase(array: [String]) {
//
//    }
//}

class Handler {
    let apiHandler: NetworkHandler
    let parseHandler: ResponseHandler
    let databaseHandler: DatabaseHandler
    
    init(apiHandler: NetworkHandler, parseHandler: ResponseHandler, dbHandler: DatabaseHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.databaseHandler = dbHandler
    }
    
    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.pareseResponse(data: data)
        databaseHandler.saveToDatabase(array: array)
    }
}

class NetworkHandler {
    func requestDataToAPI() -> Data {
        
    }
}

class ResponseHandler {
    func pareseResponse(data: Data) -> [String] {
        
    }
}

class DatabaseHandler {
    func saveToDatabase(array: [String]) {
        
    }
}
