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
    
    var noCart: Bool { cartId == nil }
    
    init() {
    }
    
    func updateWithNewOrder(order: Order) {
        Logger.debug("CartViewState - Update")
        if let orderId = order.id {
            self.cartId = orderId
            Logger.debug("CartViewState - - Order ID: \(orderId)")
            var calcSkuCount: Int = 0
            order.bags?.forEach({ bag in
                Logger.debug("CartViewState - - - Bag ID: \(bag.id ?? 0)")
                bag.skus?.forEach({ orderSku in
                    Logger.debug("CartViewState - - - OrderSku ID: \(orderSku.id ?? 0)")
                    calcSkuCount += orderSku.quantity ?? 0
                    Logger.debug("CartViewState - - - calcSkuCount: \(calcSkuCount)")
                })
            })
            
            self.skuCount = calcSkuCount
            Logger.debug("CartViewState - - skuCount: \(skuCount)")
        }
    }
}
