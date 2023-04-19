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
    
    init(offerGridItems: [ShoppingOfferGridItem] = []) {
        self.offerGridItems = offerGridItems
        
    }
    
    static func shoppingOfferGridItems(pageOffers: PageOffer?) -> [ShoppingOfferGridItem] {
        return shoppingOfferGridItems(content: pageOffers?.content)
    }
    
    static func shoppingOfferGridItems(content: [Offer]?) -> [ShoppingOfferGridItem] {
        guard let contentOffers = content else {
            return []
        }
        return contentOffers.compactMap(ShoppingOfferGridItem.fromEntity)
    }
}

extension OfferGridDataSource: EntityViewModel {
    typealias Entity = PageOffer
    static func fromEntity(entity: Entity) -> Self? {
        return OfferGridDataSource(offerGridItems: Self.shoppingOfferGridItems(pageOffers: entity))
    }
    
    static func Empty() -> Self {
        return OfferGridDataSource()
    }
}
