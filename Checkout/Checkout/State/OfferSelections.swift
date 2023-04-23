//
//  OfferSelections.swift
//  Checkout
//
//  Created by Alan Morford on 4/20/23.
//

import Combine
import SwiftUI
import VioletPublicClientAPI

class OfferSelections: ObservableObject, CustomStringConvertible {
    
    typealias OfferIDType = Int64
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var offer_ids: Set<OfferIDType>
    
    init(offer_ids: Set<OfferIDType> = Set()) {
        self.offer_ids = offer_ids
    }
    
    convenience init(offer_id: OfferIDType) {
        self.init(offer_ids: Set<OfferIDType>([offer_id]))
    }
    
    func insert(_ newMember: OfferIDType) {
        self.offer_ids.insert(newMember)
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

class OfferItemSelections: ObservableObject, CustomStringConvertible {
    
    typealias OfferIDType = Int64
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var offer_ids: Dictionary<OfferIDType, OfferItem>.Keys { offerItemsMap.keys }
    var offerItemsMap: Dictionary<OfferIDType, OfferItem>
    
    init(offerItems: [OfferItem]) {
        self.offerItemsMap = offerItems.autoDictionary()
    }
    
    func insert(_ newMember: OfferItem) {
        self.offerItemsMap[newMember.offer_id] = newMember
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
