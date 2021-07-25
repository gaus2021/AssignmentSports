//
//  ScoreCardVC+TableViewDelegate.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import Foundation
import UIKit

//MARK:- Table View DataSource Methods
extension ScoreCardViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPlayersKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewPlayersList.dequeueReusableCell(withIdentifier: Constants.shared.PlayerListTBCIdentifer, for: indexPath) as! PlayerListTableViewCell
        cell.cellSetup(cellIndex: indexPath.row, segmentIndex: segmentTeamSelection.selectedSegmentIndex, arrPlayerKeys: arrPlayersKeys, scoreCardArray: self.scoreCardArray)
        return cell
    }
}

//MARK:- Table View Delegate Methods
extension ScoreCardViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
