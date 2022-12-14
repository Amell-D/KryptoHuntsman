//
//  PortfolioDataService.swift
//  KryptoHuntsman
//
//  Created by Amel Dizdarevic on 7/22/22.
//

import Foundation
import Combine
import CoreData

final class PortfolioDataService {

    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"

    @Published var savedEntities: [PortfolioEntity] = []

    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                Info.error("Error loading Core Data! \(error)")
            }
            self.getPortfolio()
        }

    }

    // MARK: - Public

    /// Updates portfolio for given **Coin** and **Amount**
    ///
    /// If given coin id is in CoreData storage and amount if bigger then 0 we update it, if is 0 then we remove the coin from storage.  Else we add new coin to storage.
    func updatePortfolio(coin: Coin, amount: Double) {

        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {

            if amount > 0 {
                update(entity: entity, amount: amount)
            } else {
                remove(entity: entity)
            }

        } else {
            add(coin: coin, amount: amount)
        }

    }

    // MARK: - Private
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: "PortfolioEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            Info.error("Error fetching Portfolio Entities. \(error)")
        }
    }

    private func add(coin: Coin, amount: Double) {
        let entity = PortfolioEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.amount = amount
        applyChanges()
    }

    private func update(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }

    private func remove(entity: PortfolioEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }

    private func save() {
        do {
            try container.viewContext.save()
        } catch {
            Info.error("Error saving to Core Data. \(error)")
        }
    }

    private func applyChanges() {
        save()
        getPortfolio()
    }

}
