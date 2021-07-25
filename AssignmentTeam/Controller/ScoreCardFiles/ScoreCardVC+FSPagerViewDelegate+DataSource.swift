//
//  ScoreCardVC+FSPagerViewDelegate+DataSource.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import Foundation
import UIKit
import FSPagerView

//MARK:- FSPager View DataSource Methods
extension ScoreCardViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.scoreCardArray.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: Constants.shared.TeamCardCVCIdentifer, at: index) as! TeamCardCollectionViewCell
        if let ent = self.scoreCardArray[index] {
            cell.cellSetup(ent: ent, index: index)
        }
        return cell
    }
}

//MARK:- FSPager View Delegate Methods
extension ScoreCardViewController : FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        for (indexes,_) in self.scoreCardArray.enumerated(){
            self.scoreCardArray[indexes]?.isCardSelected = false
        }
        self.scoreCardArray[index]?.isCardSelected = true
        self.segmentTeamSelection.selectedSegmentIndex = 0
        self.setupSegmentTitle(arrIndex: index)
        self.tblViewPlayersList.scrollToRow(at: IndexPath(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: true)
    }
}
