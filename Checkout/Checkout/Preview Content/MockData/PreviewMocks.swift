//
//  PreviewMocks.swift
//  Checkout
//
//  Created on 4/19/23.
//

import Foundation
import Violet
import SwiftUI

struct PreviewMocks {
    
    
    static func MockOfferItemsArray2() -> [DemoProductGridOfferItem] {
        guard let pageOffers = MockOffers.load_PageOffers(),
              let innerOffers = pageOffers.content else {
            return []
        }
        return innerOffers.compactMap(DemoProductGridOfferItem.fromEntity)
    }
    
    static func MockOfferItem_12574() -> DemoProductGridOfferItem {
        guard let mockOffer = MockOffers.load_Offer_12574() else {
            return DemoProductGridOfferItem.Empty()
        }
        return DemoProductGridOfferItem.fromEntity(entity: mockOffer) ?? DemoProductGridOfferItem.Empty()
    }
    
    static func MockOfferItem_12574_ImageURLS() -> [URL] {
        guard let mockOffer = MockOffers.load_Offer_12574() else {
            return []
        }
        return mockOffer.allAlbumMediaURLs()
    }
    
    static func Mock_OfferItem_ImageURL() -> URL? {
        return Mock_DemoProductGridOfferItem_12555().firstAlbumMediaImageURL()
    }
    
    static func Mock_DemoProductGridOfferItem_12555() -> DemoProductGridOfferItem {
        guard let mockOffer = MockOffers.load_Offer_12555() else {
            return DemoProductGridOfferItem.Empty()
        }
        return DemoProductGridOfferItem.fromEntity(entity: mockOffer) ?? DemoProductGridOfferItem.Empty()
    }
    
    static func Mock_DemoProductGridOfferItem_12574() -> DemoProductGridOfferItem {
        guard let mockOffer = MockOffers.load_Offer_12574() else {
            return DemoProductGridOfferItem.Empty()
        }
        return DemoProductGridOfferItem.fromEntity(entity: mockOffer) ?? DemoProductGridOfferItem.Empty()
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


extension OfferSearchViewState {
    static func mockLoaded() -> OfferSearchViewState {
        return OfferSearchViewState(loadedOfferItems: PreviewMocks.MockOfferItemsArray2())
    }
    
    static func mockEmpty() -> OfferSearchViewState {
        return OfferSearchViewState(loadedOfferItems: [])
    }
}

extension AppStore {
    static let mockAppStore = AppStore(cartViewState: CartViewState())
    static var mockAppStoreBinding: Binding<AppStore> { .constant(mockAppStore) }
    
    //Resume a specific CardId by setting it here
    static let resumeCartId: Int64? = nil //75186
}
