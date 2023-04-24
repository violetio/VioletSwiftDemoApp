//
//  OfferItem.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import Foundation
import SwiftUI
import VioletPublicClientAPI

struct OfferItem: Identifiable, Equatable, Hashable, AutoKeyed {
    var autoKey: Int64 { offer_id }
    
    typealias Key = Int64
    public let offer_id: Int64
    public let name: String
    public let intPrice: IntPrice
    public let offerEntity: Offer?
    public let thumbnailImage: Image = Image(systemName: "questionmark.square.dashed")
    
    init(offer_id: Int64, name: String, intPrice: IntPrice, offerEntity: Offer?) {
        self.offer_id = offer_id
        self.name = name
        self.intPrice = intPrice
        self.offerEntity = offerEntity
    }
    
    var id: Int64 {
        return offer_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(offer_id)
    }
    
    func firstAlbumMediaImageURL() -> URL? {
        return offerEntity?.firstAlbumMediaImageURL()
    }
}

extension OfferItem: EntityViewModel {
    typealias Entity = Offer
    static func fromEntity(entity: Entity) -> Self? {
        guard let offer_id = entity.id else {
            return nil
        }
        return OfferItem(offer_id: offer_id,
                         name: entity.name,
                         intPrice: IntPrice(price: entity.minPrice),
                         offerEntity: entity)
    }
    
    static func Empty() -> Self {
        return OfferItem(offer_id: 0, name: "Empty 🫙", intPrice: IntPrice(price: 0), offerEntity: nil)
    }
}