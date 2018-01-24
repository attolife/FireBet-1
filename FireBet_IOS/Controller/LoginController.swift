//
//  LoginController.swift
//  FireBet_IOS
//
//  Created by Thanh Minh on 1/20/18.
//  Copyright © 2018 Thanh Minh. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var idTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginTapped(_ sender: Any) {
        let mainController = MainController()
        present(mainController, animated: true, completion: nil)
    }
}
