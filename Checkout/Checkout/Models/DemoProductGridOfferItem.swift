//
//  DemoProductGridOfferItem.swift
//  Checkout
//
//  Created on 6/29/23
//

import Foundation
import SwiftUI
import Violet

struct DemoProductGridOfferItem: Identifiable, Equatable, Hashable, AutoKeyed {
    var autoKey: Int64 { offer_id }
    
    typealias Key = Int64
    public let offer_id: Int64
    public let name: String
    public let vendor: String
    public let seller: String
    public let intPrice: IntPrice
    public let offerEntity: Offer?
    public let thumbnailImage: Image = Image(systemName: "questionmark.square.dashed")
    public let imageURLS: [URL]
    public let description: String
    public let variants: [Variant]
    public let variantViewModels: [VariantViewModel]
    
    init(offer_id: Int64, name: String, intPrice: IntPrice, offerEntity: Offer?, vendor: String,seller: String) {
        self.offer_id = offer_id
        self.name = name
        self.intPrice = intPrice
        self.offerEntity = offerEntity
        self.vendor = vendor
        self.seller = seller
        self.imageURLS = offerEntity?.allAlbumMediaURLs() ?? []
        self.description = offerEntity?.description ?? ""
        let variantsArray = offerEntity?.variantsArray() ?? []
        self.variants = variantsArray
        self.variantViewModels = variantsArray.compactMap { VariantViewModel(variant: $0)}.sorted(by: { l, r in
            l.name < r.name
        })
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
    
    func firstSku() -> Sku? {
        return offerEntity?.skus?.first
    }
    
    func skus() -> [Sku] {
        return offerEntity?.skus?.compactMap{ $0 } ?? []
    }
}

extension DemoProductGridOfferItem: EntityViewModel {
    typealias Entity = Offer
    static func fromEntity(entity: Entity) -> Self? {
        return DemoProductGridOfferItem(offer_id: entity.id!,
                                        name: entity.name!,
                                        intPrice: IntPrice(price: entity.minPrice!),
                                        offerEntity: entity,
                                        vendor: entity.vendor ?? "",
                                        seller: entity.seller ?? "")
    }
    
    static func fromEntities(entities: [Entity]) -> [Self] {
        return entities.compactMap(fromEntity)
    }
    
    static func Empty() -> Self {
        return DemoProductGridOfferItem(offer_id: 0, name: "Empty 🫙", intPrice: IntPrice(price: 0), offerEntity: nil, vendor: "", seller: "")
    }
}
