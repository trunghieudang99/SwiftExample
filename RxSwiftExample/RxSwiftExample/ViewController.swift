//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 08/11/2021.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "View Controller"

    }
}

struct Content {
    var name: String
    let fileExtension: String
    
    var filename: String {
        get {
            name + "." + fileExtension
        }
    }
}

struct ContentViewModel {
    private var content: Content
    
    init(_ content: Content) {
        self.content = content
    }
    
    var name: String {
        get {
            content.name
        }
        set {
            content.name = newValue
        }
    }
}
