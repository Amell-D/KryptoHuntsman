//
//  MarketDataServiceTests.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import XCTest
import Combine

@testable import SwiftyCrypto

class MarketDataServiceTests: XCTestCase {

    lazy var mockGlobalData: GlobalData = {
        return GlobalData(data: MarketData.testableMarketData)
    }()

    var subscriptions = Set<AnyCancellable>()

    override func tearDown() {
        subscriptions = []
    }

    func testLoadingMarketDataAtInit() throws {
        let data = try JSONEncoder().encode(mockGlobalData)
        let mock = NetworkingManagerMock(result: .success(data))
        let service = MarketDataService(networkingManager: mock)

        let promise = expectation(description: "loading market data")
        service.$marketData
            .contains(where: { marketData in
                marketData != nil
            })
            .sink(receiveValue: { (_) in
                promise.fulfill()
            })
            .store(in: &subscriptions)

        wait(for: [promise], timeout: 1)
    }

    func testError() throws {
        let mock = NetworkingManagerMock(result: .failure(NetworkingManager.NetworkingError.badResponse(statusCode: 429)))
        let service = MarketDataService(networkingManager: mock)

        service.$serviceIsActive
            .filter({
                !$0 // is not active
            })
            .first()
            .sink { (_) in
                XCTFail("data stream to fetch did complete")
            }
            .store(in: &subscriptions)

        let promise = expectation(description: "should get error message")

        service.$error
            .filter({ error in
                error != nil
            })
            .first()
            .sink { (_) in
                promise.fulfill()
            }
            .store(in: &subscriptions)
        wait(for: [promise], timeout: 1)
    }

}
