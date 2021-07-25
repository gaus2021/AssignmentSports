//
//  TeamCardCollectionViewCell.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import UIKit
import FSPagerView

class TeamCardCollectionViewCell: FSPagerViewCell {

    //MARK:- Declaring Outlets
    @IBOutlet weak var ViewCard: UIView!
    
    ///Team 1 (Left Side)
    @IBOutlet weak var lblTeam1Name: UILabel!
    @IBOutlet weak var lblTeam1ScoreName: UILabel!
    @IBOutlet weak var lblTeam1OversName: UILabel!
    @IBOutlet weak var imgViewTeam1: UIImageView!
    
    ///Team 2 (Right Side)
    @IBOutlet weak var lblTeam2Name: UILabel!
    @IBOutlet weak var lblTeam2ScoreName: UILabel!
    @IBOutlet weak var lblTeam2OversName: UILabel!
    @IBOutlet weak var imgViewTeam2: UIImageView!
    
    
    //MARK:- Initilization Code
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK:- Cell Setup
    func cellSetup(ent: ScoreCardModel, index: Int) {
        ViewCard.backgroundColor = ent.isCardSelected == true ? Constants.shared.CardSelectedColor : Constants.shared.CardUnselectedColor
        
        lblTeam1Name.textColor = ent.isCardSelected == true ? Constants.shared.CardUnselectedColor : Constants.shared.BlackColor
        lblTeam1ScoreName.textColor = ent.isCardSelected == true ? Constants.shared.CardUnselectedColor : Constants.shared.BlackColor
        lblTeam1OversName.textColor = ent.isCardSelected == true ? Constants.shared.CardUnselectedColor : Constants.shared.BlackColor
        
        lblTeam2Name.textColor = ent.isCardSelected == true ? Constants.shared.CardUnselectedColor : Constants.shared.BlackColor
        lblTeam2ScoreName.textColor = ent.isCardSelected == true ? Constants.shared.CardUnselectedColor : Constants.shared.BlackColor
        lblTeam2OversName.textColor = ent.isCardSelected == true ? Constants.shared.CardUnselectedColor : Constants.shared.BlackColor
        
        if let teamName1 = ent.teams[ent.matchdetail.teamHome]{
            lblTeam1Name.text = teamName1.nameShort
        }
        
        if ent.innings.count >= 1 {
            if let inings = ent.innings[0] as? Inning{
                lblTeam1OversName.text = inings.overs
                lblTeam1ScoreName.text = inings.total + "/" + inings.wickets
            }
        }
        
        if let teamName2 = ent.teams[ent.matchdetail.teamAway]{
            lblTeam2Name.text = teamName2.nameShort
        }
        
        if ent.innings.count >= 2 {
            if let inings = ent.innings[1] as? Inning{
                lblTeam2OversName.text = inings.overs
                lblTeam2ScoreName.text = inings.total + "/" + inings.wickets
            }
        }
    }
}
