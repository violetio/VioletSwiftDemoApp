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

    init(loadedOfferItems: [DemoProductGridOfferItem] = [], loading: Bool = false) {
        self.loadedOfferItems = loadedOfferItems
        self.loading = loading
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

