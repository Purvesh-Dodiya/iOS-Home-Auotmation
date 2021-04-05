//
//  ViewController.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 05/04/21.
//

import UIKit
import FirebaseAuth

class MainVC: UITabBarController {

    //MARK:- Variables
    lazy var rightItem: UIBarButtonItem = { return UIBarButtonItem(title: logoutLable, style: UIBarButtonItem.Style.plain, target: self, action: #selector(onClickOfLogout))}()
    
    //MARK:- View LifCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
    }


}

//MARK:- Navigation SetUp
extension MainVC {
    func setUpNavigation() {
        self.navigationItem.rightBarButtonItem = rightItem
        self.title = appName
    }
    
}

//MARK:- Other Functions
extension MainVC {
    @objc func onClickOfLogout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            guard let signUpVC = UIStoryboard(name: stbAuth, bundle: nil).instantiateViewController(withIdentifier: vcLoginNavigation) as? LoginNavigatiopnVC else {
                return
            }
            UIApplication.shared.windows.first?.rootViewController =   signUpVC
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            alertDialog(message: signOutError.localizedDescription, self: self)
        }
        
    }
}
