//
//  JSONParsable.swift
//  CustomerApp
//
//  Created by Bee on 9/29/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import UIKit
import SwiftyJSON

public protocol JSONParsable {
    
    init(json: JSON)
    func export() -> JSON
}

extension JSONParsable {
    
    func export() -> JSON {
        return .null
    }
}
