//
//  NetworkingManagerMock .swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/27/22.
//

import Foundation
import Combine

struct NetworkingManagerMock: DataProvider {

    var result: Result<Data, NetworkingManager.NetworkingError>

    func fetch(url: URL) -> AnyPublisher<Data, NetworkingManager.NetworkingError> {
        result.publisher
            .eraseToAnyPublisher()
    }

}
