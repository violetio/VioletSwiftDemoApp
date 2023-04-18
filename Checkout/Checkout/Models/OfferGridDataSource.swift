//
//  OfferGridDataSource.swift
//  Checkout
//
//  Created by Alan Morford on 4/18/23.
//

import SwiftUI
import VioletPublicClientAPI

struct OfferGridDataSource {
    let offerGridItems: [ShoppingOfferGridItem]
    
    init(pageOffers: PageOffer? = nil) {
        if let aPageOfOffers = pageOffers {
            offerGridItems = Self.shoppingOfferGridItems(pageOffers: aPageOfOffers)
        } else {
            offerGridItems = Array(1...20).map { ShoppingOfferGridItem(name: "Item \($0)" ) }
        }
    }
    
    static func shoppingOfferGridItems(pageOffers: PageOffer?) -> [ShoppingOfferGridItem] {
        return shoppingOfferGridItems(content: pageOffers?.content)
    }
    
    static func shoppingOfferGridItems(content: [Offer]?) -> [ShoppingOfferGridItem] {
        guard let contentOffers = content else {
            return []
        }
        return contentOffers.map(ShoppingOfferGridItem.fromOffer)
    }
    
    static func MockOfferGridDataSource() -> OfferGridDataSource {
        return OfferGridDataSource()
    }
}
