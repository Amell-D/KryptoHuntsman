//
//  CoinImageServiceTests.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import Foundation
import XCTest
import Combine

@testable import SwiftyCrypto

class CoinImageServiceTests: XCTestCase {

    lazy var mockImage: UIImage = {
        return UIImage(systemName: "plus")!
    }()

    lazy var mockData: Data = {
        mockImage.pngData()!
    }()

    lazy var mockCoin: Coin = {
        Coin.testableCoin
    }()

    var subscriptions = Set<AnyCancellable>()

    override func tearDown() {
        subscriptions = []
    }

    func testLoadingImageAtInit() throws {
        let mock = NetworkingManagerMock(result: .success(mockData))
        let service = CoinImageService(networkingManager: mock, coin: mockCoin)

        let promise = expectation(description: "loading 1 image")
        service.$image
            .contains(where: { image in
                image != nil
            })
            .sink { _ in
                promise.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [promise], timeout: 1)
    }
//    
    func testError() throws {
        let mock = NetworkingManagerMock(result: .failure(NetworkingManager.NetworkingError.badResponse(statusCode: 400)))
        let service = CoinImageService(networkingManager: mock, coin: mockCoin)

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
