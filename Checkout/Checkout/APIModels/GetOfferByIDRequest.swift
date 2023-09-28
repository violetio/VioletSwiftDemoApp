//
//  GetOffer.swift
//  Checkout
//
//  Created on 3/9/23.
//

import Foundation
import Violet

class GetOfferByIDRequest: ProxyAPICall<Offer> {
    let offerId: Int64

    init(offerId: Int64) {
        self.offerId = offerId
        super.init()
    }

    override func send() {
        CatalogOffersAPI.getOfferById(offerId: offerId) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
        
    }
}
