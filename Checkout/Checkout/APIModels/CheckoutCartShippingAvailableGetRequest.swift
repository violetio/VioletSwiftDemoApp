//
//  CheckoutCartShippingAvailableGetRequest.swift
//  Checkout
//
//  Created on 3/24/23.
//

import Violet

class CheckoutCartShippingAvailableGetRequest: ProxyAPICall<OrderShippingMethodWrapperArray> {
    let orderId: Int64

    init(orderId: Int64) {
        self.orderId = orderId
        super.init()
    }

    override func send() {
        CheckoutShippingAPI.getAvailableShippingMethods(cartId: orderId)
        { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
