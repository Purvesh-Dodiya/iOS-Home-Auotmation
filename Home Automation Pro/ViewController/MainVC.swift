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
    lazy var logoutItem: UIBarButtonItem = {
        let  logoutImage = UIImage(systemName: "power")
        return UIBarButtonItem(image: logoutImage, style: .plain, target: self, action: #selector(onClickOfLogout))}()
    
    lazy var addItem: UIBarButtonItem = {
        let addImage = UIImage(systemName: "plus")
        return UIBarButtonItem(image: addImage, style: .plain, target: self, action: #selector(onClickOfAdd))
        
    }()
    //MARK:- View LifCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
    }


}

//MARK:- Navigation SetUp
extension MainVC {
    func setUpNavigation() {
        self.navigationItem.setRightBarButtonItems([logoutItem,addItem], animated: true)
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
    
    @objc func onClickOfAdd() {
        
        guard let addAppliancesVC = UIStoryboard(name: "AddAppliances", bundle: nil).instantiateViewController(withIdentifier: "AddAppliancesVC") as? AddAppliancesVC else {
            return
        }
        self.navigationController?.pushViewController(addAppliancesVC, animated: true)
    }
}
