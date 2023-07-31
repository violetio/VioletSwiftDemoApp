//
//  CheckoutCartShippingAvailableGetRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/24/23.
//

import Violet

class ApplyShippingMethodsRequest: ChannelHeadersAPICall<Order> {
    let orderId: Int64
    let body: [BagShippingMethod]

    init(channelHeaders: ChannelHeaders, orderId: Int64, body: [BagShippingMethod]) {
        self.orderId = orderId
        self.body = body
        super.init(channelHeaders: channelHeaders)
    }

    override func send() {
        CheckoutShippingAPI.applyShippingMethods(cartId: orderId,
                                                 priceCart: false,
                                                 body: body) { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
