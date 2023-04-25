//
//  PreviewMocks.swift
//  Checkout
//
//  Created by Alan Morford on 4/19/23.
//

struct PreviewMocks {
    
    static func MockOfferItemsArray() -> [OfferItem] {
        guard let pageOffers = MockOffers.load_PageOffers(),
              let innerOffers = pageOffers.content else {
            return []
        }
        return innerOffers.compactMap(OfferItem.fromEntity)
    }
    
    static func MockOfferItem() -> OfferItem {
        guard let mockOffer = MockOffers.load_Offer_12555() else {
            return OfferItem.Empty()
        }
        return OfferItem.fromEntity(entity: mockOffer) ?? OfferItem.Empty()
    }
    
    static func Mock_OfferSelectionsState() -> OfferSelections {
        return OfferSelections(offer_id: 12555)
    }
    
    static func Mock_OfferItemSelections() -> OfferItemSelections {
        return OfferItemSelections(offerItems: [MockOfferItem()])
    }
}
