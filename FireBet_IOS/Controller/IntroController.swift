//
//  IntroController.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/20/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit

class IntroController: UIViewController {
    var isVersionUpdated: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        checkTheVersion()
    }
    
    func checkTheVersion(){
        if(isVersionUpdated){
            let loginController = LoginController()
            present(loginController, animated: true, completion: nil)
        }
    }
}
