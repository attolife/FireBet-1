//
//  ChannelData.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/21/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit

class ChannelData{
    let title: String
    let min: String
    let max: String
    
    init(dictionary: [String:Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.min = dictionary["min"] as? String ?? ""
        self.max = dictionary["max"] as? String ?? ""
    }
}

