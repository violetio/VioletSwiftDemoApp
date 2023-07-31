//
//  AddSkuToCartRequest.swift
//  Checkout
//
//  Created on 7/18/23
//

import Foundation
import Violet

class RemoveSkuFromCartRequest: ChannelHeadersAPICall<Order> {
    let orderId: Int64
    let orderSkuId: Int64

    init(channelHeaders: ChannelHeaders, orderId: Int64, orderSkuId: Int64) {
        self.orderId = orderId
        self.orderSkuId = orderSkuId
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutItemsAPI.removeSkuFromCart(cartId: orderId,
                                           orderSkuId: orderSkuId) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
        
    }
}
