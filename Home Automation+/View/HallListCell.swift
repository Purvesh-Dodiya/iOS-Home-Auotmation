//
//  HallListCell.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 06/04/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class HallListCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var uiVIew: CustomUIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var switchStauts: UISwitch!
    @IBOutlet weak var lblAppliancesName: UILabel!
    
    //MARK:- VARIABLES
    var ref = Database.database().reference()
    let currentUID = Auth.auth().currentUser?.uid
    var keyPrimices: String?
    var keyAppliances: String?
    
    //MARK:- View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        uiVIew.layer.shadowOffset = CGSize(width: 1, height: 3)
    }

    
}

//Configure cell
extension HallListCell {
    func configure(list: DataModel) {
        keyPrimices = list.keyPrimices
        keyAppliances = list.keyAppliances
        lblAppliancesName.text = list.name
        switchStauts.isOn = (list.status == "ON")
        if let url = URL(string: list.img) {
            loadImage(url: url, imageOutlet: imgIcon)
            switch keyAppliances {
            case "FAN":
                list.status == "ON" ? imgIcon.rotate() : imgIcon.layer.removeAllAnimations()
            case "LIGHT":
                list.status == "ON" ? imgIcon.lightAnimation(): imgIcon.layer.removeAllAnimations()
            case "AC":
                list.status == "ON" ? imgIcon.acAn(): imgIcon.layer.removeAllAnimations()
            default:
                print("Ok")
            }
        }
        
        
        //imgIcon.rotate()
    }
}

//MARK:- Action Outlets
extension HallListCell {
    @IBAction func onClickOfSwitch(_ sender: UISwitch) {
        let status = sender.isOn ? "ON" : "OFF"
        guard let uid = currentUID,let keyAppli = keyAppliances,let keyPrim = keyPrimices else {
            return
        }
        switch keyAppliances {
        case "FAN":
            status == "ON" ? imgIcon.rotate() : imgIcon.layer.removeAllAnimations()
        case "LIGHT":
            status == "ON" ? imgIcon.lightAnimation(): imgIcon.layer.removeAllAnimations()
        default:
            print("Ok")
        }
        
        self.ref.child("users").child(uid).child("SWITCH").child(keyPrim).child(keyAppli).updateChildValues(["status": status])
    }
}
