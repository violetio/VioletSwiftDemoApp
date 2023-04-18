//
//  ShoppingOfferGridItem.swift
//  Checkout
//
//

import Foundation
import SwiftUI
import VioletPublicClientAPI

struct ShoppingOfferGridItem {
    public let offer_id: Int64
    public let name: String
    public let price: Int
    public let thumbnailImage: Image
    
    init(offer_id: Int64 = 0, name: String, price: Int = 0, thumbnailImage: Image = Image(systemName: "questionmark.square.dashed")) {
        self.name = name
        self.price = price
        self.thumbnailImage = thumbnailImage
        self.offer_id = offer_id
    }
    
}

extension ShoppingOfferGridItem {
    static func fromOffer(offer: Offer) -> ShoppingOfferGridItem? {
        guard let offer_id = offer.id else {
            return nil
        }
        return ShoppingOfferGridItem(offer_id: offer_id,
                                     name: offer.name,
                                     price: offer.minPrice)
    }
}
