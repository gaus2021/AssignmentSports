//
//  Constants.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import Foundation
import UIKit

class Constants: NSObject {
    
    static let shared = Constants()
    
    ///Collection and Table View Cells
    let TeamCardCVCIdentifer = "TeamCardCollectionViewCell"
    let PlayerListTBCIdentifer = "PlayerListTableViewCell"
    
    ///Fonts Name
    let Roboto_Bold = "Roboto-Bold"
    
    ///Color Name
    let CardSelectedColor = UIColor(red: 4/255, green: 39/255, blue: 126/255, alpha: 1)
    let CardUnselectedColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    let BlackColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 1)
    
    ///Alert
    let okTitle = "Ok"
    let noInterntConnection = "Please check your Internet connections"
}
