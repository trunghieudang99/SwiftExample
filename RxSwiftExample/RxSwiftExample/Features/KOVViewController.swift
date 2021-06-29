//
//  KOVViewController.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 28/06/2021.
//

import UIKit

class KOVViewController: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
    }
}

class MyObjectToObserve: NSObject {
    @objc dynamic var myDate = NSDate(timeIntervalSince1970: 0)
    
    func updateDate() {
        myDate = myDate.addingTimeInterval(Double(2 << 30))
    }
}

class MyObserver: NSObject {
    @objc var objectToObserver: MyObjectToObserve
    var observation: NSKeyValueObservation?
    
    init(object: MyObjectToObserve) {
        objectToObserver = object
        super.init()
        
        observation = observe(\.objectToObserver.myDate, options: [.old, .new], changeHandler: { (object, change) in
            print("myDate changed from: \(change.oldValue!), updated to: \(change.newValue!)")
        })
    }
    
}

