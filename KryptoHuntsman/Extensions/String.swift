//
//  String.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/23/22.
//

import Foundation

extension String {

    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

}
