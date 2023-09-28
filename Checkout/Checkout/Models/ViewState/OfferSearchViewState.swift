//
//  OfferSearchViewState.swift
//  Checkout
//
//  Created on 7/31/23
//

import Foundation
import Violet

class OfferSearchViewState: ObservableObject {
    @Published var loadedOfferItems: [DemoProductGridOfferItem]
    
    var emtpy: Bool { loadedOfferItems.count == 0 }

    init(loadedOfferItems: [DemoProductGridOfferItem] = []) {
        self.loadedOfferItems = loadedOfferItems
    }

    func updateLoadedOfferItems(_ pageOffer: PageOffer) {
        guard let offersContent = pageOffer.content else {
            return
        }
        Logger.info("OfferSearchViewState: PageOffer with count: \(offersContent.count)")
        loadedOfferItems = DemoProductGridOfferItem.fromEntities(entities: offersContent)
        Logger.info("OfferSearchViewState: loadedOfferItems.count: \(loadedOfferItems.count)")
    }
}


