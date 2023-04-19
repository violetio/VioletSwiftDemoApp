//
//  PreviewMocks.swift
//  Checkout
//
//  Created by Alan Morford on 4/19/23.
//

struct PreviewMocks {
    
    static func MockOfferGridDataSource() -> OfferGridDataSource {
        return OfferGridDataSource(pageOffers: MockOffers.load_PageOffers())
    }
}
