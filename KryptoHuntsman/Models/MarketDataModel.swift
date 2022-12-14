//
//  MarketDataModel.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import Foundation

struct GlobalData: Codable {
    let data: MarketData?
}

struct MarketData: Codable {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int
    let markets: Int
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int

    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }

    static var testableMarketData: MarketData {
        // swiftlint:disable:next line_length
        return MarketData(activeCryptocurrencies: 9313, upcomingIcos: 0, ongoingIcos: 50, endedIcos: 3375, markets: 642, totalMarketCap: [ "btc": 47521614.13723755, "eth": 649679753.9285526, "ltc": 12056358512.930134, "bch": 3417681362.7590866, "bnb": 5313125127.722114, "eos": 457025933279.4503, "xrp": 1987162244125.5957, "xlm": 6585786984555.02, "link": 76667667100.32605, "dot": 59996560938.32368, "yfi": 66382973.14899105, "usd": 2133648531251.5566, "aed": 7836758769078.05, "ars": 209140307978273.12, "aud": 2903714290908.2124, "bdt": 181854903315239.97, "bhd": 804199868859.617, "bmd": 2133648531251.5566, "brl": 11194827113770.693, "cad": 2704237356072.9766, "chf": 1963564738582.8413, "clp": 1682296520950602.8, "cny": 13771421080110.07, "czk": 45901195788354.49, "dkk": 13466019163940.84, "eur": 1810874448740.8845, "gbp": 1545119989579.3777, "hkd": 16598334692135.883, "huf": 634433317722770.8, "idr": 304332958255066.10, "ils": 6836743306262.827, "inr": 157118664566676.5, "jpy": 234934972951843.5, "krw": 2510497484224640.5, "kwd": 641773740769.5626, "lkr": 427142085036540.5, "mmk": 3699162934173797, "mxn": 42437202462327.85, "myr": 8847173634834.586, "ngn": 880471402906269.9, "nok": 18533724601863.54, "nzd": 3004339289290.566, "php": 106609080260667.47, "pkr": 359653456997315.94, "pln": 8222959821477.218, "rub": 156050786278676.25, "sar": 8002127198492.663, "sek": 18465279290629.527, "sgd": 2866748830104.2783, "thb": 70046614456722.88, "try": 18034664210403.81, "twd": 59121269286097.875, "uah": 57154719573219.96, "vef": 213642227434.21857, "vnd": 48757577678979.860, "zar": 30384413937655.598, "xdr": 1497072358304.1238, "xag": 90143428636.09631, "xau": 1192773538.4255574, "bits": 47521614137237.55, "sats": 4752161413723755], totalVolume: ["btc": 3047858.0887131603, "eth": 41668022.6257866, "ltc": 773249614.542574, "bch": 219197263.71346316, "bnb": 340763917.4483295, "eos": 29311929167.110283, "xrp": 127449132974.58258, "xlm": 422387675499.6247, "link": 4917176605.989758, "dot": 3847954386.034911, "yfi": 4257554.911343805, "usd": 136844213996.30591, "aed": 502620313667.1651, "ars": 13413474919153.814, "aud": 186233343490.78265, "bdt": 11663491405002.254, "bhd": 51578363229.98958, "bmd": 136844213996.30591, "brl": 717994221995.8195, "cad": 173439641080.05423, "chf": 125935677477.59053, "clp": 107896188967527.39, "cny": 883247294817.7583, "czk": 2943930533612.0293, "dkk": 863659961403.1825, "eur": 116142694991.3728, "gbp": 99098200761.27689, "hkd": 1064554930825.7439, "huf": 40690173393232.26, "idr": 1951877446336311.2, "ils": 438483072697.6649, "inr": 10077001831301.684, "jpy": 15067847981026.26, "krw": 161013892370973.72, "kwd": 41160960595.30691, "lkr": 27395291227877.105, "mmk": 237250435934895.8, "mxn": 2721762994279.5273, "myr": 567424533335.6829, "ngn": 56470133347715.75, "nok": 1188683580457.5127, "nzd": 192687053467.06238, "php": 6837506543114.955, "pkr": 23066823758917.062, "pln": 527389800621.5652, "rub": 10008512123261.814, "sar": 513226424472.9463, "sek": 1184293754916.7258, "sgd": 183862517483.2966, "thb": 4492527123391.719, "try": 1156675718803.7773, "twd": 3791816462467.852, "uah": 3665689339934.8896, "vef": 13702211147.450123, "vnd": 3127128154481023.5, "zar": 1948742345393.6536, "xdr": 96016605906.29407, "xag": 5781461406.580805, "xau": 76500020.95035487, "bits": 3047858088713.16, "sats": 304785808871316.00], marketCapPercentage: ["btc": 39.591325634827626, "eth": 18.07564921970732, "ada": 3.6587990695102715, "usdt": 3.2670332588794584, "bnb": 2.9056828150538188, "xrp": 2.345379942859983, "sol": 2.1972398461107194, "dot": 1.7080725491839428, "doge": 1.478721425070377, "usdc": 1.3748867016706416], marketCapChangePercentage24HUsd: -1.450779216907877, updatedAt: 1631516163)
    }

    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "eur"}) {
            return "???" + item.value.formattedWithAbbreviations()
        }

        return ""
    }

    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "eur"}) {
            return "???" + item.value.formattedWithAbbreviations()
        }

        return ""
    }

    /// Market cap procentage BITCONs have over all markecap
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return "\(item.value.asPercentString())"
        }

        return ""
    }
}
