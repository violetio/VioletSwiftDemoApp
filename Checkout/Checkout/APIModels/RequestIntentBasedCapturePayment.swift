//
//  CheckoutCartPaymentPostRequest.swift
//  Checkout
//
//  Created on 3/24/23.
//

import Violet

class RequestIntentBasedCapturePayment: ProxyAPICall<Order> {
    let body: PaymentMethodRequest
    let cartId: Int64

    init(cartId: Int64) {
        self.cartId = cartId
        self.body = PaymentMethodRequest(intentBasedCapture: true)
        super.init()
    }

    override func send() {
        CheckoutPaymentAPI.applyPaymentMethod(cartId: cartId, body: body)
        { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
