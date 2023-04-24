//
//  NavigationModel.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI
import Combine

class ShoppingNavigationModel {
    @Published var offerItemPath: [OfferItem]
    @Published var loadedOfferItems: [OfferItem]
    @Published var offerItemSelections: OfferItemSelections
    
    init(offerItemPath: [OfferItem] = [],
         loadedOfferItems: [OfferItem] = [],
         offerItemSelections: OfferItemSelections = OfferItemSelections()) {
        self.offerItemPath = offerItemPath
        self.loadedOfferItems = loadedOfferItems
        self.offerItemSelections = offerItemSelections
    }
}

final class NavigationModel: ObservableObject, Codable {
    @Published var selectedTab: Tab
    @State var shoppingNavigationModel: ShoppingNavigationModel
    
    init(selectedTab: Tab = .shopping,
         offerItemPath: [OfferItem] = [],
         loadedOfferItems: [OfferItem] = []) {
        self.selectedTab = selectedTab
        self.shoppingNavigationModel = ShoppingNavigationModel(offerItemPath: offerItemPath, loadedOfferItems: loadedOfferItems)
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.selectedTab = try container.decodeIfPresent(
            Tab.self, forKey: .selectedTab) ?? .shopping
        self.shoppingNavigationModel = ShoppingNavigationModel()
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(selectedTab, forKey: .selectedTab)
    }

    enum CodingKeys: String, CodingKey {
        case selectedTab

    }
}
