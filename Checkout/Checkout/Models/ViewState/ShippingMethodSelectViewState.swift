//
//  ShippingMethodSelectViewState.swift
//  Checkout
//
//  Created on 8/30/23
//

import SwiftUI
import Violet
import Combine

/**
 
 */
class OrderShippingMethodSelectViewState: ObservableObject {
    var bagIDToBagShippingMethodStateMap: [BagID: BagShippingMethodSelectViewState] = [:]
    
    init(orderShippingMethods: OrderShippingMethodWrapperArray?) {
        self.loadFrom(orderShippingMethods: orderShippingMethods)
    }
    
    func loadFrom(orderShippingMethods: OrderShippingMethodWrapperArray?) {
        guard let foundOrderShippingMethods = orderShippingMethods else {
            return
        }
        
        
        var buildBagIDToBagShippingMethodStateMap: [BagID: BagShippingMethodSelectViewState] = [:]
        foundOrderShippingMethods.forEach { shippingMethodWrapper in
            let next = BagShippingMethodSelectViewState(shippingMethodWrapper: shippingMethodWrapper)
            buildBagIDToBagShippingMethodStateMap[next.bagID] = next
        }
        self.bagIDToBagShippingMethodStateMap = buildBagIDToBagShippingMethodStateMap
        Logger.debug("bagIDToBagShippingMethodStateMap: \(bagIDToBagShippingMethodStateMap)")
    }
}


class BagShippingMethodSelectViewState: ObservableObject {
 
    @Published var bagID: Int64 = 0
    var shippingMethodArray: [ShippingMethodArrayItem] = []
    var merchantName: String = "Merchant Name"
    
    init(shippingMethodWrapper: OrderShippingMethodWrapper?) {
        self.loadFrom(shippingMethodWrapper: shippingMethodWrapper)
    }
    
    func loadFrom(shippingMethodWrapper: OrderShippingMethodWrapper?) {
        guard let found = shippingMethodWrapper else {
            return
        }
        if let aBagId = found.bagId,
           let arrayOfShippingMethods = found.shippingMethods {
            self.bagID = aBagId
            self.shippingMethodArray = arrayOfShippingMethods.compactMap { ShippingMethodArrayItem( $0) }
        }
        
    }
    
}

class ShippingMethodArrayItem: Identifiable {
    let bagID: BagID
    let price: Int
    let shippingMethodId: String
    let label: String
    
    var id: String { shippingMethodId }
    
    init?(_ orderShippingMethod: OrderShippingMethod?) {
        guard let found = orderShippingMethod else { return nil }
        guard let aBagId = found.bagId else { return nil }
        guard let aPrice = found.price else { return nil }
        guard let aShippingMethodId = found.shippingMethodId else { return nil }
        guard let aLabel = found.label else { return nil }
        
        self.bagID = aBagId
        self.price = aPrice
        self.shippingMethodId = aShippingMethodId
        self.label = aLabel
    }
}
