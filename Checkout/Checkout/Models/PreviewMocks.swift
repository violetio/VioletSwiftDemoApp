//
//  PreviewMocks.swift
//  Checkout
//
//  Created by Alan Morford on 4/19/23.
//

import VioletPublicClientAPI

struct PreviewMocks {
    
    static func MockOfferItemsArray() -> [OfferItem] {
        guard let pageOffers = MockOffers.load_PageOffers(),
              let innerOffers = pageOffers.content else {
            return []
        }
        return innerOffers.compactMap(OfferItem.fromEntity)
    }
    
    static func MockOfferItemsArray2() -> [DemoProductGridOfferItem] {
        guard let pageOffers = MockOffers.load_PageOffers(),
              let innerOffers = pageOffers.content else {
            return []
        }
        return innerOffers.compactMap(DemoProductGridOfferItem.fromEntity)
    }
    
    static func MockOfferItem() -> OfferItem {
        guard let mockOffer = MockOffers.load_Offer_12555() else {
            return OfferItem.Empty()
        }
        return OfferItem.fromEntity(entity: mockOffer) ?? OfferItem.Empty()
    }

    static func Mock_DemoProductGridOfferItem() -> DemoProductGridOfferItem {
        guard let mockOffer = MockOffers.load_Offer_12555() else {
            return DemoProductGridOfferItem.Empty()
        }
        return DemoProductGridOfferItem.fromEntity(entity: mockOffer) ?? DemoProductGridOfferItem.Empty()
    }
        
    static func Mock_OfferItemSelections() -> OfferItemSelections {
        return OfferItemSelections(items: [MockOfferItem()])
    }
    
    static func orderShippingMethodWrapperArray() -> OrderShippingMethodWrapperArray {
        return [OrderShippingMethodWrapper(bagId: nil,
                                           shippingMethods: orderShippingMethods())]
    }
    
    static func orderShippingMethods() -> [OrderShippingMethod] {
        return [OrderShippingMethod(price: 500, shippingMethodId: "ground" , bagId: 1),
                OrderShippingMethod(price: 1500, shippingMethodId: "express" , bagId: 1)]
    }
}
