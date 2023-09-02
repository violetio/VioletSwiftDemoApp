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
    var bagIDToMerchantNameMap: [BagID: String] = [:]
    @Published var bagIDToShippingMethodIDs: [Int64:String] = [:]
    
    init(orderShippingMethods: OrderShippingMethodWrapperArray?, order: Order? = nil) {
        self.loadFrom(orderShippingMethods: orderShippingMethods, order: order)
    }
    
    func loadFrom(orderShippingMethods: OrderShippingMethodWrapperArray?, order: Order? = nil) {
        guard let foundOrderShippingMethods = orderShippingMethods else {
            return
        }
        if let orderBags = order?.bags {
            var buildBagIDToMerchantNameMap: [BagID: String] = [:]
            orderBags.forEach { bag in
                if let bagId = bag.id,
                   let merchantName = bag.merchantName {
                    buildBagIDToMerchantNameMap[bagId] = merchantName
                }
            }
            self.bagIDToMerchantNameMap = buildBagIDToMerchantNameMap
        }
        
        
        var buildBagIDToBagShippingMethodStateMap: [BagID: BagShippingMethodSelectViewState] = [:]
        foundOrderShippingMethods.forEach { shippingMethodWrapper in
            let next = BagShippingMethodSelectViewState(shippingMethodWrapper: shippingMethodWrapper)
            if let bagMerchantName = self.bagIDToMerchantNameMap[next.bagID] {
                next.merchantName = bagMerchantName
            }
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
    @Published var selectedShippingMethodID: String?
    
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
        self.selectedShippingMethodID = Self.preselectedShippingMethodID(shippingMethodArray: self.shippingMethodArray)
        
    }
    
    static func preselectedShippingMethodID(shippingMethodArray: [ShippingMethodArrayItem]) -> String? {
        return shippingMethodArray.first?.shippingMethodId
    }
    
}

class ShippingMethodArrayItem: Identifiable {
    let bagID: BagID
    let price: Int
    let intPrice: IntPrice
    let shippingMethodId: String
    let label: String
    var priceText: String { intPrice.priceText() }
    
    var id: String { shippingMethodId }
    
    init?(_ orderShippingMethod: OrderShippingMethod?) {
        guard let found = orderShippingMethod else { return nil }
        guard let aBagId = found.bagId else { return nil }
        guard let aPrice = found.price else { return nil }
        guard let aShippingMethodId = found.shippingMethodId else { return nil }
        guard let aLabel = found.label else { return nil }
        
        self.bagID = aBagId
        self.price = aPrice
        self.intPrice = IntPrice(price: aPrice)
        self.shippingMethodId = aShippingMethodId
        self.label = aLabel
    }
    
    init(bagID: BagID, price: Int, shippingMethodId: String, label: String) {
        self.bagID = bagID
        self.price = price
        self.intPrice = IntPrice(price: price)
        self.shippingMethodId = shippingMethodId
        self.label = label
    }
    
}

