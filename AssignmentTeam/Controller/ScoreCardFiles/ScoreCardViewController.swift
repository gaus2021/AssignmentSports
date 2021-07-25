//
//  ScoreCardViewController.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import UIKit
import FSPagerView

class ScoreCardViewController: UIViewController {
    
    //MARK:- Outlet Declaration
    @IBOutlet weak var segmentTeamSelection: UISegmentedControl!
    @IBOutlet weak var tblViewPlayersList: UITableView!
    @IBOutlet weak var pagerView: FSPagerView! { didSet {
        let nib = UINib(nibName: Constants.shared.TeamCardCVCIdentifer, bundle: nil)
        self.pagerView.register(nib, forCellWithReuseIdentifier: Constants.shared.TeamCardCVCIdentifer)}}
    
    //MARK:- Declaring Variable
    var scoreCardArray: [ScoreCardModel?] = [ScoreCardModel?]()
    var arrPlayersKeys : [String] = [String]()
    var arrApiEndpoints : [String] = [ApiEndPoints().SaPk,ApiEndPoints().NzIn]
    
    //MARK:- View Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //MARK:- Initial ViewController Setup
    func initialSetup() {
        let font =  UIFont(name: Constants.shared.Roboto_Bold, size: 15)
        segmentTeamSelection.setTitleTextAttributes([NSAttributedString.Key.font: font!], for: .normal)
        segmentTeamSelection.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        tblViewPlayersList.register(UINib(nibName: Constants.shared.PlayerListTBCIdentifer, bundle: nil), forCellReuseIdentifier: Constants.shared.PlayerListTBCIdentifer)
        getDataFromApi()
    }
    
    //MARK:- Custom Functions
    
    ///Get player keys data
    func getPlayerKeysData(segmentIndex: Int) {
        for (index, _) in self.scoreCardArray.enumerated() {
            if self.scoreCardArray[index]?.isCardSelected == true, let dataEnt = self.scoreCardArray[index]{
                if segmentIndex == 0 { ///Home team
                    arrPlayersKeys = (dataEnt.teams[dataEnt.matchdetail.teamHome]?.players.allKeys())!
                } else { /// Away Team
                    arrPlayersKeys = (dataEnt.teams[dataEnt.matchdetail.teamAway]?.players.allKeys())!
                }
                break
            }
        }
        DispatchQueue.main.async {
            self.tblViewPlayersList.reloadData()
            self.tblViewPlayersList.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: true)
        }
    }
    
    ///Setup Segment title
    func setupSegmentTitle(arrIndex: Int) {
        if let team1Name = self.scoreCardArray[arrIndex]?.teams[self.scoreCardArray[arrIndex]?.matchdetail.teamHome ?? ""] {
            self.segmentTeamSelection.setTitle(team1Name.nameFull, forSegmentAt: 0)
        }
        
        if let team2Name = self.scoreCardArray[arrIndex]?.teams[self.scoreCardArray[arrIndex]?.matchdetail.teamAway ?? ""] {
            self.segmentTeamSelection.setTitle(team2Name.nameFull, forSegmentAt: 1)
        }
        
        getPlayerKeysData(segmentIndex: segmentTeamSelection.selectedSegmentIndex)
        
        DispatchQueue.main.async {
            self.pagerView.reloadData()
        }
    }
    
    ///Fetch data from Api
    func getDataFromApi() {
        if !ReachabilityTest.isConnectedToNetwork() {
            Utility().showAlert(alertTitle: Constants.shared.okTitle, alertMessage: Constants.shared.noInterntConnection)
        } else {
            for obj in arrApiEndpoints {
                GetScoreCardResource().getDataForScoreCard(ApiEndPoints: obj) { entScore, error in
                    if error == nil {
                        self.scoreCardArray.append(entScore)
                        self.scoreCardArray[0]?.isCardSelected = true
                    } else {
                        Utility().showAlert(alertTitle: Constants.shared.okTitle, alertMessage: error?.reason ?? "")
                    }
                }
            }
            setupSegmentTitle(arrIndex: 0)
        }
    }
    
    //MARK:- Segment Tapped Actions
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        getPlayerKeysData(segmentIndex: sender.selectedSegmentIndex)
    }
}
