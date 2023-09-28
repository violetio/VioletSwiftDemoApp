//
//  UpdateSkuInCartRequest.swift
//  Checkout
//
//  Created on 8/21/23
//

import Foundation
import Violet

class UpdateSkuInCartRequest: ProxyAPICall<Order> {
    let orderId: Int64
    let orderSkuId: Int64
    let orderSku: OrderSku

    init(orderId: Int64, orderSkuId: Int64, orderSku: OrderSku) {
        self.orderId = orderId
        self.orderSkuId = orderSkuId
        self.orderSku = orderSku
        super.init()
    }

    override func send() {
        CheckoutItemsAPI.updateSkuInCart(cartId: orderId,
                                         orderSkuId: orderSkuId,
                                         body: orderSku) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
