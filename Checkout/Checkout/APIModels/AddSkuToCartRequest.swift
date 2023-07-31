//
//  AddSkuToCartRequest.swift
//  Checkout
//
//  Created on 7/18/23
//

import Foundation
import Violet

class AddSkuToCartRequest: ChannelHeadersAPICall<Order> {
    let orderId: Int64
    let orderSku: OrderSku

    init(channelHeaders: ChannelHeaders, orderId: Int64, orderSku: OrderSku) {
        self.orderId = orderId
        self.orderSku = orderSku
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutItemsAPI.addSkuToCart(cartId: orderId,
                                      body: orderSku) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
        
    }
}
