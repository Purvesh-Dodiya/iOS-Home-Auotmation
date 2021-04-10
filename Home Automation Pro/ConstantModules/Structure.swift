//
//  Structure.swift
//  Home Automation+
//
//  Created by Purvesh Dodiye on 06/04/21.
//

import UIKit

struct DataModel {
    var name: String
    var img: String
    var status: String
    var keyPrimices: String
    var keyAppliances: String
}

enum typeOfDropDown: Int {
    case appliances
    case primces
}
