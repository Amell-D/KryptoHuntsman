//
//  CoinDetailDataService.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import XCTest
import Combine

@testable import SwiftyCrypto

class CoinDetailDataServiceTests: XCTestCase {

    lazy var mockCoin: Coin = {
        return Coin.testableCoin
    }()

    lazy var mockCoinDetails: CoinDetail = {
        return CoinDetail.testableCoinDetail
    }()

    var subscriptions = Set<AnyCancellable>()

    override func tearDown() {
        subscriptions = []
    }

    func testLoadingDetailsAtLaunch() throws {
        let data = try JSONEncoder().encode(mockCoinDetails)
        let mock = NetworkingManagerMock(result: .success(data))
        let service = CoinDetailDataService(networkingManager: mock, coin: mockCoin)

        let promise = expectation(description: "loading coin details")
        service.$coinDetails
            .contains(where: { coinDetail in
                coinDetail != nil
            })
            .sink { _ in
                promise.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [promise], timeout: 1)
    }

    func testError() throws {
        let mock = NetworkingManagerMock(result: .failure(NetworkingManager.NetworkingError.badResponse(statusCode: 400)))
        let service = CoinDetailDataService(networkingManager: mock, coin: mockCoin)

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
