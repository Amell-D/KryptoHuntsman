//
//  UIApplication.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import Foundation
import SwiftUI

extension UIApplication {

    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
