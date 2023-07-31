//
//  ShoppingViewState.swift
//  Checkout
//
//  Created on 5/6/23
//

import Foundation
import Violet

class ShoppingViewState: ObservableObject {
    @Published var offerPath: [Offer]
    @Published var loadedOfferItems: [OfferItem]
    @Published var offerItemPath: [OfferItem]

    init(offerPath: [Offer], loadedOfferItems: [OfferItem], offerItemPath: [OfferItem]) {
        self.offerPath = offerPath
        self.loadedOfferItems = loadedOfferItems
        self.offerItemPath = offerItemPath
    }

    convenience init() {
        self.init(offerPath: [],loadedOfferItems: [], offerItemPath: [])
    }

    func mergePageOffer(_ pageOffer: PageOffer) {
        guard let offersContent = pageOffer.content else {
            return
        }
        Logger.info("ShoppingViewState: PageOffer with count: \(offersContent.count)")
        loadedOfferItems = OfferItem.fromEntities(entities: offersContent)
        Logger.info("ShoppingViewState: loadedOfferItems.count: \(loadedOfferItems.count)")
    }
}
