//
//  CartViewState.swift
//  Checkout
//
//  Created on 5/6/23
//

import Foundation
import Violet

class CartViewState: ObservableObject {
    @Published var cartId: Int64? = nil
    @Published var skuCount: Int = 0
    @Published var bagViewStates: [Int64: BagViewState] = [:]
    
    var noCart: Bool { cartId == nil }
    
    var cartEmpty: Bool { skuCount == 0 }
    
    var bagViewStatesArray: [BagViewState] { return Array(bagViewStates.values) }
    
    init(skuCount: Int = 0) {
        self.skuCount = skuCount
    }
    
    convenience init(order: Order) {
        self.init()
        self.updateWithNewOrder(order: order)
    }
    
    func updateWithNewOrder(order: Order) {
        Logger.debug("CartViewState - Update")
        if let orderId = order.id {
            self.cartId = orderId
            Logger.debug("CartViewState - - Order ID: \(orderId)")
            var calcSkuCount: Int = 0
            order.bags?.forEach({ bag in
                Logger.debug("CartViewState - - - Bag ID: \(bag.id ?? 0)")
                if let bagID = bag.id {
                    var orderSkuViewStates: [OrderSkuID: OrderSkuViewState] = [:]
                    var bagSkuCount: Int = 0
                    bag.skus?.forEach({ orderSku in
                        if let orderSkuID = orderSku.id {
                            Logger.debug("CartViewState - - - OrderSku ID: \(orderSkuID)")
                            let nextOrderSkuViewState = OrderSkuViewState(orderSkuID: orderSkuID, skuCount: orderSku.quantity ?? 0)
                            orderSkuViewStates[orderSkuID] = nextOrderSkuViewState
                            calcSkuCount += nextOrderSkuViewState.skuCount
                            bagSkuCount += nextOrderSkuViewState.skuCount
                            Logger.debug("CartViewState - - - calcSkuCount: \(calcSkuCount)")
                        }
                    })
                    bagViewStates[bagID] = BagViewState(bagID: bagID, skuCount: bagSkuCount, orderSkuViewStates: orderSkuViewStates)
                }
            })
            
            self.skuCount = calcSkuCount
            Logger.debug("CartViewState - - skuCount: \(skuCount)")
        }
    }
}

class BagViewState: ObservableObject, Identifiable {
    @Published var bagID: Int64
    @Published var skuCount: Int = 0
    @Published var orderSkuViewStates: [OrderSkuID: OrderSkuViewState]
    
    var orderSkuViewStatesArray: [OrderSkuViewState] { return Array(orderSkuViewStates.values) }
    
    var id: Int64 { bagID }
    
    init(bagID: Int64, skuCount: Int, orderSkuViewStates: [OrderSkuID: OrderSkuViewState] = [:]) {
        self.bagID = bagID
        self.skuCount = skuCount
        self.orderSkuViewStates = orderSkuViewStates
        Logger.debug("BagViewState - Init - bagID: \(bagID) - skuCount - \(skuCount) - orderSkuIDCount - \(orderSkuViewStates)")
    }
    
}

class OrderSkuViewState: ObservableObject, Identifiable {
    @Published var orderSkuID: OrderSkuID
    @Published var skuCount: Int = 0
    
    init(orderSkuID: OrderSkuID, skuCount: Int) {
        self.orderSkuID = orderSkuID
        self.skuCount = skuCount
    }
    
    init?(orderSku: OrderSku) {
        guard let orderSkuId = orderSku.id,
              let orderQuantity = orderSku.quantity else {
            return nil
        }
        
        self.orderSkuID = orderSkuId
        self.skuCount = orderQuantity
    }
    
    
    
}
