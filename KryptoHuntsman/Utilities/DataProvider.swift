//
//  DataProvider.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/26/22.
//

import Foundation
import Combine

protocol DataProvider {
    func fetch(url: URL) -> AnyPublisher<Data, NetworkingManager.NetworkingError>
}
