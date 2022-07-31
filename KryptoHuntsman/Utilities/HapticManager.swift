//
//  HapticManager.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/28/22.
//

import Foundation
import SwiftUI

final class HapticManager {

    static let generator = UINotificationFeedbackGenerator()

    static func notification(notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(notificationType)
    }
}
