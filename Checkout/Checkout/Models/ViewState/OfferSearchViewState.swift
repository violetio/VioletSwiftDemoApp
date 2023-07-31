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

    init(loadedOfferItems: [DemoProductGridOfferItem]) {
        self.loadedOfferItems = loadedOfferItems
    }

    convenience init() {
        self.init(loadedOfferItems: [])
    }

}

extension OfferSearchViewState {
    static func mockLoaded() -> OfferSearchViewState {
        return OfferSearchViewState(loadedOfferItems: PreviewMocks.MockOfferItemsArray2())
    }
    
    static func mockEmpty() -> OfferSearchViewState {
        return OfferSearchViewState(loadedOfferItems: [])
    }
}

