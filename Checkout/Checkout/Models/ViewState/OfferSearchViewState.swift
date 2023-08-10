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
    @Published var loading: Bool
    
    var emtpy: Bool { loadedOfferItems.count == 0 }

    init(loadedOfferItems: [DemoProductGridOfferItem] = [], loading: Bool = false) {
        self.loadedOfferItems = loadedOfferItems
        self.loading = loading
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

extension OfferSearchViewState {
    static func mockLoaded() -> OfferSearchViewState {
        return OfferSearchViewState(loadedOfferItems: PreviewMocks.MockOfferItemsArray2())
    }
    
    static func mockEmpty() -> OfferSearchViewState {
        return OfferSearchViewState(loadedOfferItems: [])
    }
    
    static func mockLoading() -> OfferSearchViewState {
        return OfferSearchViewState(loading: true)
    }
}

