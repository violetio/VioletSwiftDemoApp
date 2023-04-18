//
//  ShoppingOfferGridItem.swift
//  Checkout
//
//

import Foundation
import SwiftUI

struct ShoppingOfferGridItem {
    public let name: String
    public let price: Int
    public let thumbnailImage: Image
    
    init(name: String, price: Int = 0, thumbnailImage: Image = Image(systemName: "questionmark.square.dashed")) {
        self.name = name
        self.price = price
        self.thumbnailImage = thumbnailImage
    }
    
}
