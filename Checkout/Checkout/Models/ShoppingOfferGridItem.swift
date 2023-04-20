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
    public let firstAlbumMediaImageURL: URL?
    
    init(offer_id: Int64 = 0, name: String, price: Int = 0,
         firstAlbumMediaImageURL: URL? = nil,
         thumbnailImage: Image = Image(systemName: "questionmark.square.dashed")) {
        self.name = name
        self.price = price
        self.thumbnailImage = thumbnailImage
        self.offer_id = offer_id
        self.firstAlbumMediaImageURL = firstAlbumMediaImageURL
    }
    
    public var priceText: String {
        return String(price)
    }
}

extension ShoppingOfferGridItem: EntityViewModel {
    typealias Entity = Offer
    static func fromEntity(entity: Entity) -> Self? {
        guard let offer_id = entity.id else {
            return nil
        }
        return ShoppingOfferGridItem(offer_id: offer_id,
                                     name: entity.name,
                                     price: entity.minPrice,
                                     firstAlbumMediaImageURL: entity.firstAlbumMediaImageURL())
    }
    
    static func Empty() -> Self {
        return ShoppingOfferGridItem(offer_id: 0, name: "", price: 0)
    }
}

extension ShoppingOfferGridItem: Identifiable, Equatable {
    var id: Int64 {
        return offer_id
    }
}
