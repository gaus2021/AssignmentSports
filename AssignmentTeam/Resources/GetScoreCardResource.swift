//
//  GetScoreCardResource.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import Foundation


struct GetScoreCardResource {
    
    func getDataForScoreCard(ApiEndPoints: String, completionHandler: @escaping(ScoreCardModel?,HttpNetworkError?) -> Void){
            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            
            let url = URL(string: ApiEndPoints)
            HttpUtility.shared.getData(requestUrl: url!, resultType: ScoreCardModel.self) { response in
                switch response
                {
                case .success(let scoreCardResponse):
                    completionHandler(scoreCardResponse!,nil)
                case .failure(let error):
                    completionHandler(nil,error)
                    break
                }
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
    }
    
}
