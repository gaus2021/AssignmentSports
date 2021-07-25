//
//  Utility.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import Foundation
import UIKit

class Utility : NSObject {
    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    func showAlert(alertTitle: String, alertMessage: String) {
        let alertMsg = alertMessage
        let alert = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: alertTitle, style: UIAlertAction.Style.default, handler: nil))
        self.topMostController().present(alert, animated: true, completion: nil)
    }
    
}
