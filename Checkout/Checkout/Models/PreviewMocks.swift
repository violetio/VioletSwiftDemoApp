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
    
    static func Mock_ShoppingOfferGridItem() -> ShoppingOfferGridItem {
        guard let mockOffer = MockOffers.load_Offer_12555() else {
            return ShoppingOfferGridItem.Empty()
        }
        return ShoppingOfferGridItem.fromEntity(entity: mockOffer) ?? ShoppingOfferGridItem.Empty()
    }
}
