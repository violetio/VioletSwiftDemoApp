//
//  ShoppingOfferGridItem.swift
//  Checkout
//
//

import Foundation
import SwiftUI
import VioletPublicClientAPI

struct ShoppingOfferGridItem {
    
    public let offerItem: OfferItem
    public var offer_id: Int64 { offerItem.offer_id }
    public var name: String { offerItem.name }
    public var intPrice: IntPrice { offerItem.intPrice }
    public let thumbnailImage: Image
    public let firstAlbumMediaImageURL: URL?
    public var offerEntity: Offer? { offerItem.offerEntity }
    
    init(offer_id: Int64 = 0, name: String, price: Int = 0,
         firstAlbumMediaImageURL: URL? = nil,
         thumbnailImage: Image = Image(systemName: "questionmark.square.dashed"),
         offerEntity: Offer? = nil) {
        self.offerItem = OfferItem(offer_id: offer_id, name: name, intPrice: IntPrice(price: price), offerEntity: offerEntity)
        self.thumbnailImage = thumbnailImage
        self.firstAlbumMediaImageURL = firstAlbumMediaImageURL
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
                                     firstAlbumMediaImageURL: entity.firstAlbumMediaImageURL(),
                                     offerEntity: entity)
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
