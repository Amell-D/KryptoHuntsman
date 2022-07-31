//
//  CoinImageViewModel.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/23/22.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {

    @Published var image: UIImage?
    @Published var isLoading: Bool = false

    private let coin: Coin
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()

    // MARK: Dependecies
    let networkingManager: DataProvider

    init(networkingManager: DataProvider, coin: Coin) {
        self.coin = coin
        self.networkingManager = networkingManager
        self.dataService = CoinImageService(networkingManager: networkingManager, coin: coin)
        addSubscribers()
    }

    private func addSubscribers() {
        dataService.$image
            .combineLatest(dataService.$isLoading)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (returnedImage, isLoading) in
                self?.image = returnedImage
                self?.isLoading = isLoading
            }
            .store(in: &cancellables)

    }
}
