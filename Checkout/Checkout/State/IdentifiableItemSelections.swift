//
//  IdentifiableItemSelections.swift
//  Checkout
//
//  Created by Alan Morford on 5/1/23.
//

import Combine
import SwiftUI
import Violet

typealias ItemType = Identifiable & AutoKeyed
class IdentifiableItemSelections<T: ItemType>: ObservableObject, CustomStringConvertible where T.ID == T.Key {
//
    @Published var itemCount: Int = 0
//
    var didChange = PassthroughSubject<Void, Never>()
//
    var itemIds: Dictionary<T.Key, T>.Keys { itemsMap.keys }
    var itemsMap: Dictionary<T.Key, T>
    var items: [T]  { Array(itemsMap.values) }
//
    init(items: [T] = []) {
        self.itemsMap = items.autoDictionary()
    }

    func insert(_ newMember: T) {
        self.itemsMap[newMember.id] = newMember
        self.itemCount = itemIds.count
        didChange.send()
    }

    func contains(_ itemId: T.Key) -> Bool {
        return self.itemIds.contains(itemId)
    }

    var description: String { return itemIds.description }

    func itemIdsList() -> [T.Key] {
        return Array(itemIds)
    }
    
}
