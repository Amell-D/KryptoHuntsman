//
//  Info.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/26/22.
//

import Foundation

final class Info {

    static func log(_ message: String, function: String = #function) {
        print("✅[INFO] \(message) from \(function)")
    }

    static func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        print("❌[ERROR] \(message) from \(function) on line: \(line) in file: \(file)")
    }

    static func debug(_ message: String, function: String = #function, line: Int = #line) {
        print("🤬[DEBUG] \(message) from \(function) on line: \(line)")
    }

}
