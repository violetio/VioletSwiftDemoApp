//
//  AddSkuToCartRequest.swift
//  Checkout
//
//  Created on 7/18/23
//

import Foundation
import Violet

class AddSkuToCartRequest: ProxyAPICall<Order> {
    let orderId: Int64
    let orderSku: OrderSku

    init(orderId: Int64, orderSku: OrderSku) {
        self.orderId = orderId
        self.orderSku = orderSku
        super.init()
    }

    override func send() {
        CheckoutItemsAPI.addSkuToCart(cartId: orderId,
                                      body: orderSku) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
        
    }
}
