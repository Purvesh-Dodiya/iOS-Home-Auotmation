//
//  SignUpVC.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 05/04/21.
//

import UIKit

import FirebaseAuth

class SignUpVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPass: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    //View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
      
    }

}

//MARK:- Action Outlets
extension SignUpVC {
    @IBAction func onClickOfsignup(_ sender: Any) {
        if (txtEmail.text == "" || (txtPassword.text == "") || (txtConfirmPass.text == ""))  {
            alertDialog(message: "Enter email and password", self: self)
        }else if (txtPassword.text != txtConfirmPass.text )  {
            alertDialog(message: "Password not match", self: self)
        } else {
            
            guard let email = txtEmail.text, let password = txtPassword.text else {
                return
            }
            activityIndicator.isHidden = false
            btnSignUp.isHidden = true
            startAuth(email: email, password: password)
        }
    }
    
}

//MNARK:- Start Auth
extension SignUpVC {
    func startAuth (email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                if let errCode = AuthErrorCode(rawValue: error?._code ?? 0) {
                    alertDialog(message: getErrorMessage(of: errCode), self: self   )
                }
                self.activityIndicator.isHidden = true
                self.btnSignUp.isHidden = false
            } else {
               
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
