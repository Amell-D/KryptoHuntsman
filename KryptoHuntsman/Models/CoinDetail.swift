//
//  CoinDetail.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/23/22.
//

import Foundation

// MARK: - CoinDetail
struct CoinDetail: Codable {
    let id, symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, links, description
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
    }

    var readableDescription: String? {
        return description?.en?.removingHTMLOccurances
    }

    static var testableCoinDetail: CoinDetail {
        return CoinDetail(id: "testcoin", symbol: "tit", name: "Testcoin", blockTimeInMinutes: 10, hashingAlgorithm: "test", description: Description(en: "Ahhh test here we go again"), links: nil)
    }
}

// MARK: - Description
struct Description: Codable {
    let en: String?
}

// MARK: - Links
struct Links: Codable {
    let homepage: [String]?
    let subredditURL: String?

    enum CodingKeys: String, CodingKey {
        case homepage
        case subredditURL = "subreddit_url"
    }
}
