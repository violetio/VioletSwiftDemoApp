//
//  OfferPDPViewState.swift
//  Checkout
//
//  Created on 8/14/23
//

import Foundation
import Violet

class OfferPDPViewState: ObservableObject {
    @Published var offer: Offer
    @Published var variantsViewModel: VariantsViewModel
    

    init(offer: Offer) {
        self.offer = offer
        self.variantsViewModel = VariantsViewModel(offer: offer)
    }

}

