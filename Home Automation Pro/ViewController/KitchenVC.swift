//
//  KitchenVC.swift
//  Home Automation Pro
//
//  Created by Purvesh Dodiye on 10/04/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class KitchenVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var tblListOfHallAppliances: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //MARK:- Variables
    var ref = Database.database().reference()
    let currentUID = Auth.auth().currentUser?.uid
    var list: [DataModel] = []
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetUP()
    }
    
    //MARK:- ViewWill Appear
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
}

//MARK:- Table Setup
extension KitchenVC {
    func tableSetUP() {
        tblListOfHallAppliances.delegate = self
        tblListOfHallAppliances.dataSource = self
        tblListOfHallAppliances.register(UINib(nibName: hallCell, bundle: nil), forCellReuseIdentifier: cellIndetifire)
        tblListOfHallAppliances.tableFooterView = UIView()
        tblListOfHallAppliances.isHidden = true
        activityIndicator.isHidden = false
    }
}
//MARK:- UITableViewDataSource
extension KitchenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifire) as? HallListCell else {
            return UITableViewCell()
        }
        cell.configure(list: list[indexPath.row])
        return cell
    }
    
    
}

//MARK:- UITableViewDelegate
extension KitchenVC: UITableViewDelegate {
    
}

//MARK:- Load Data From Firebase
extension KitchenVC {
    func loadData(){
        guard let uid = currentUID else {
            return
        }
        list.removeAll()
        self.ref.child("users/\(uid)").child("SWITCH/KITCHEN").observe(.childAdded, with: { (snapshot) -> Void in
            
            guard let value = (snapshot.value)  as? [String : String] else {
                return
            }
            guard let name = value["name"],let img = value["img"], let status = value["status"]  else {
                return
            }
            self.list.append(DataModel(name: name, img: img, status: status,keyPrimices: "KITCHEN",keyAppliances: snapshot.key))
            DispatchQueue.main.async {
                self.tblListOfHallAppliances.reloadData()
                self.tblListOfHallAppliances.isHidden = false
                self.activityIndicator.isHidden = true
            }
            
        })
    }
}
