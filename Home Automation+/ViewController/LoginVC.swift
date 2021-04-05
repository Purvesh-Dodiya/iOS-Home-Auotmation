//
//  LoginVC.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 05/04/21.
//

import UIKit

class LoginVC: UIViewController {

    //MARK:- Outlets
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
}

//MARK:- Action Outlets
extension LoginVC {
    @IBAction func onClickOfSignUp(_ sender: UIButton) {
        guard let signUpVC = UIStoryboard(name: "Auth", bundle: nil) else {
            <#statements#>
        }
    }
}
