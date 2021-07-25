//
//  Dictonary+Extension.swift
//  AssignmentTeam
//
//  Created by Gaus on 25/07/21.
//

import Foundation

extension Dictionary {
    func allKeys() -> [String] {
        guard self.keys.first is String else {
            debugPrint("This function will not return other hashable types. (Only strings)")
            return []
        }
        return self.compactMap { (anEntry) -> String? in
            guard let temp = anEntry.key as? String else { return nil }
            return temp }
    }
}
