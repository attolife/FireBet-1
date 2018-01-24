//
//  TableData.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/21/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit

enum GameType: String {
    case Baccarat
    case DragonTiger
    case Sicbo
    case Roulette
}

class TableData {
    // title
    let name: String
    let icon: String
    
    // label
    let firstLbl: String
    let secondLbl: String
    let thirdLbl: String
    let forthLbl: String
    
    // data
    let firstResult: String
    let secondResult: String
    let thirdResult: String
    let forthResult: String
    
    var gameType: GameType
    
    init(gameType: GameType, dictionary: [String:Any]) {
        self.gameType = gameType
        
        // title
        self.name = dictionary["name"] as? String ?? ""
        self.icon = dictionary["icon"] as? String ?? ""
       
        // label
        self.firstLbl = dictionary["firstLbl"] as? String ?? ""
        self.secondLbl = dictionary["secondLbl"] as? String ?? ""
        self.thirdLbl = dictionary["thirdLbl"] as? String ?? ""
        self.forthLbl = dictionary["forthLbl"] as? String ?? ""
     
        // data
        self.firstResult = dictionary["firstResult"] as? String ?? ""
        self.secondResult = dictionary["secondResult"] as? String ?? ""
        self.thirdResult = dictionary["thirdResult"] as? String ?? ""
        self.forthResult = dictionary["forthResult"] as? String ?? ""
    }
}
