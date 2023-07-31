//
//  PreviewMocks.swift
//  Checkout
//
//  Created by Alan Morford on 4/19/23.
//

import Foundation
import Violet

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
    
    static func Mock_OfferItem_ImageURL() -> URL? {
        return MockOfferItem().firstAlbumMediaImageURL()
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
        return [OrderShippingMethod(bagId: 1,
                                    merchantId: 2,
                                    price: 500,
                                    shippingMethodId: "ground",
                                    type: .flatRatePrice ),
                OrderShippingMethod(bagId: 1,
                                    merchantId: 2,
                                    price: 1500,
                                    shippingMethodId: "express",
                                    type: .flatRatePrice)]
    }
    
    static func offer() -> Offer{
        return Offer(available: true,
                     merchantId: 42,
                     minPrice: 199,
                     name: "Offer Name",
                     productId: "01001",
                     source: .shopify,
                     visible: true)
    }
}
