//
//  OfferItemSelections.swift
//  Checkout
//
//  Created by Alan Morford on 4/23/23.
//

import Combine
import SwiftUI
import VioletPublicClientAPI

class OfferItemSelections: ObservableObject, CustomStringConvertible {
    
    typealias OfferIDType = Int64
    
    @Published var itemCount: Int = 0
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var offer_ids: Dictionary<OfferIDType, OfferItem>.Keys { offerItemsMap.keys }
    var offerItemsMap: Dictionary<OfferIDType, OfferItem>
    var offerItems: [OfferItem]  { Array(offerItemsMap.values) }
    
    init(offerItems: [OfferItem] = []) {
        self.offerItemsMap = offerItems.autoDictionary()
    }
    
    func insert(_ newMember: OfferItem) {
        self.offerItemsMap[newMember.offer_id] = newMember
        self.itemCount = offer_ids.count
        didChange.send()

    }
    
    func contains(_ offer_id: OfferIDType) -> Bool {
        return self.offer_ids.contains(offer_id)
    }
    
    var description: String { return offer_ids.description }
    
    func offerIdsList() -> [OfferIDType] {
        return Array(offer_ids)
    }
    
}
