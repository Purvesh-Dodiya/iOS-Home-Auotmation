//
//  LoginVC.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 05/04/21.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = appName
        self.activityIndicator.isHidden = true
        if Auth.auth().currentUser != nil {
            guard let signUpVC = UIStoryboard(name: stbMain, bundle: nil).instantiateViewController(withIdentifier: navigationVC) as? NavigationVC else {
                return
            }
            UIApplication.shared.windows.first?.rootViewController =   signUpVC
            
        }
        Auth.auth().addStateDidChangeListener() { auth, user in
            guard let isVerified = user?.isEmailVerified else {
                return
            }
            if user != nil {
                if !isVerified {
                    let firebaseAuth = Auth.auth()
                    do {
                        try firebaseAuth.signOut()
                    } catch let signOutError as NSError {
                        print ("Error signing out: %@", signOutError)
                        alertDialog(message: signOutError.localizedDescription, self: self)
                    }
                    user?.sendEmailVerification(completion: {(error) in
                        
                        if error != nil {
                            alertDialog(message: error?.localizedDescription ?? "Something went wrong", self: self)
                        } else {
                            alertDialog(message: "Email verification link sent,kindly verify it.", self: self)
                        }
                    })
                } else {
                    guard let signUpVC = UIStoryboard(name: stbMain, bundle: nil).instantiateViewController(withIdentifier: navigationVC) as? NavigationVC else {
                        return
                    }
                    UIApplication.shared.windows.first?.rootViewController =   signUpVC
                }
                
            }
        }
    }
    
    
}

//MARK:- Action Outlets
extension LoginVC {
    @IBAction func onClickOfSignUp(_ sender: UIButton) {
        guard let signUpVC = UIStoryboard(name: stbAuth, bundle: nil).instantiateViewController(withIdentifier: vcSignUp) as? SignUpVC else {
            return
        }
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func onClickOfLogin(_ sender: Any) {
        if (txtEmail.text == "" || (txtPassword.text == ""))  {
            alertDialog(message: "Enter email and password", self: self)
        } else {
            
            guard let email = txtEmail.text, let password = txtPassword.text else {
                return
            }
            activityIndicator.isHidden = false
            btnLogin.isHidden = true
            startAuth(email: email, password: password)
        }
    }
    
}

//Firebase Auth
extension LoginVC {
    func startAuth(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if error != nil {
                if let errCode = AuthErrorCode(rawValue: error?._code ?? 0) {
                    alertDialog(message: getErrorMessage(of: errCode), self: strongSelf)
                }
                strongSelf.activityIndicator.isHidden = true
                strongSelf.btnLogin.isHidden = false
            }
        }
    }
    
    
}
