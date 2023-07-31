//
//  GetCartByIDRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import Violet

class GetCartByIDRequest: ChannelHeadersAPICall<Order> {
    let orderId: Int64    

    init(channelHeaders: ChannelHeaders, orderId: Int64) {
        self.orderId = orderId
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        
        CheckoutCartAPI.getCart(cartId: orderId) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
        
    }
}
