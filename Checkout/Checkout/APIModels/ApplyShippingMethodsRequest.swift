//
//  CheckoutCartShippingAvailableGetRequest.swift
//  Checkout
//
//  Created on 3/24/23.
//

import Violet

class ApplyShippingMethodsRequest: ProxyAPICall<Order> {
    let orderId: Int64
    let body: [BagShippingMethod]

    init(orderId: Int64, body: [BagShippingMethod]) {
        self.orderId = orderId
        self.body = body
        super.init()
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
