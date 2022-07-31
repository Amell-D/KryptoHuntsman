//
//  QuickActionService.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import Foundation

enum QuickAction: String {
    case protfolio, about
}

final class QuickActionService: ObservableObject {

    @Published var action: QuickAction?

    init(initialValue: QuickAction? = nil) {
        action = initialValue
    }
}
