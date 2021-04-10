//
//  AddAppliances.swift
//  Home Automation Pro
//
//  Created by Purvesh Dodiye on 10/04/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddAppliancesVC: UIViewController, UIPickerViewDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPrimices: UITextField!
    @IBOutlet weak var txtAppliances: UITextField!
    @IBOutlet weak var itemPickerView: UIPickerView!
    
    var currentItem = typeOfDropDown.appliances
    let currentUID = Auth.auth().currentUser?.uid
    let mRef = Database.database().reference().child("users")
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
}

//MARK:- Action Outlets
extension AddAppliancesVC {
    @IBAction func onClickOfAdd(_ sender: Any) {
        if txtName.text == "" {
            alertDialog(message: "Please enter appliances name", self: self)
        } else if txtPrimices.text == "" {
            alertDialog(message: "Please select primces", self: self)
        } else if txtAppliances.text == "" {
            alertDialog(message: "Please select appliances type", self: self)
        } else {
            addToDatabase()
        }
    }
    
}

//MARK:- Other Function
extension AddAppliancesVC {
    func setUp() {
        txtPrimices.delegate = self
        txtAppliances.delegate = self
        itemPickerView.delegate = self
        itemPickerView.dataSource = self
    }
    
    func addToDatabase() {
        let url: String?
        switch txtAppliances.text {
        case "AC":
             url = acImg
        case "TV":
             url = tvImg
        case "FAN":
             url = fanImg
        case "LIGHT":
             url = lightImg
        default:
             url = lightImg
        }
        
        guard let uid = currentUID, let keyPrim = txtPrimices.text, let keyAppli = txtAppliances.text,let imgUrl = url else {
            return
        }
        let keyPush = mRef.childByAutoId()
     
        let valueForUpload = ["name": txtName.text, "status": "OFF","key": keyPrim+"_"+keyAppli+"_\(keyPush)","img": imgUrl] as [String : Any]
        mRef.child(uid).child("SWITCH").child(keyPrim).child(keyAppli).updateChildValues(valueForUpload)
        self.navigationController?.popViewController(animated: true)
        
    }
}

//MARK:- UIPickerViewDataSource
extension AddAppliancesVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return singleRow
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch currentItem {
        case .appliances:
            return appliancesArray.count
        case .primces:
            return primicesArray.count
        }
    }
    
    
}

//MARK:- UIDocumentPickerDelegate
extension AddAppliancesVC: UIDocumentPickerDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch currentItem {
        case .appliances:
            return appliancesArray[row]
        case .primces:
            return primicesArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch currentItem {
        case .appliances:
            txtAppliances.text = appliancesArray[row]
        case .primces:
            txtPrimices.text = primicesArray[row]
        }
        view.endEditing(true)
    }
}

extension AddAppliancesVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtPrimices:
            txtPrimices.inputView = itemPickerView
            currentItem = typeOfDropDown.primces
        case txtAppliances:
            txtAppliances.inputView = itemPickerView
            currentItem = typeOfDropDown.appliances
        default:
            txtAppliances.inputView = itemPickerView
            currentItem = typeOfDropDown.appliances
        }
        itemPickerView.reloadAllComponents()
        return true
        
    }
}
