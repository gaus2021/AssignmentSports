//
//  PlayerListTableViewCell.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import UIKit

class PlayerListTableViewCell: UITableViewCell {

    //MARK:- Declaring Outlets
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblPlayerType: UILabel!
    
    @IBOutlet weak var viewPlayerKepper: UIView!
    @IBOutlet weak var viewPlayerCaptain: UIView!
    
    //MARK:- Initial Cell Setup
    override func awakeFromNib() {
        super.awakeFromNib()
        circleView(view: viewPlayerKepper)
        circleView(view: viewPlayerCaptain)
    }
    
    //MARK:- Table View Cell Setup
    
    func cellSetup(cellIndex: Int, segmentIndex: Int, arrPlayerKeys: [String], scoreCardArray: [ScoreCardModel?]) {
        for (index, obj) in scoreCardArray.enumerated() {
            if obj?.isCardSelected == true {
                if scoreCardArray[index]?.isCardSelected == true, let scoreEnt = scoreCardArray[index]{
                    let playerEnt = scoreEnt.teams[segmentIndex == 0 ? scoreEnt.matchdetail.teamHome as! String : scoreEnt.matchdetail.teamAway as! String]?.players[arrPlayerKeys[cellIndex]]
                    lblPlayerName.text = playerEnt?.nameFull
                    
                    viewPlayerCaptain.isHidden = true
                    viewPlayerKepper.isHidden = true
                    if playerEnt?.iscaptain == true && playerEnt?.iskeeper == true {
                        viewPlayerCaptain.isHidden = false
                        viewPlayerKepper.isHidden = false
                    } else if playerEnt?.iscaptain == true {
                        viewPlayerCaptain.isHidden = false
                    } else if playerEnt?.iskeeper == true {
                        viewPlayerKepper.isHidden = false
                    }
                }
            }
        }
    }
    
    //MARK:- Making the Cirle View
    func circleView(view:UIView) {
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
    }

}
