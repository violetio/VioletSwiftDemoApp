//
//  CheckoutCartShippingAvailableGetRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import Violet

class CheckoutCartShippingAvailableGetRequest: ChannelHeadersAPICall<OrderShippingMethodWrapperArray> {
    let orderId: Int64

    init(channelHeaders: ChannelHeaders, orderId: Int64) {
        self.orderId = orderId
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutShippingAPI.getAvailableShippingMethods(cartId: orderId)
        { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
