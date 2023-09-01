//
//  CheckoutCartPaymentPostRequest.swift
//  Checkout
//
//  Created on 3/24/23.
//

import Violet

class CheckoutCartPaymentPostRequest: ProxyAPICall<Order> {
    let body: PaymentMethodRequest
    let cartId: Int64
    let priceCart: Bool

    init(cartId: Int64, priceCart: Bool, paymentMethodRequest: PaymentMethodRequest) {
        self.cartId = cartId
        self.body = paymentMethodRequest
        self.priceCart = priceCart
        super.init()
    }

    override func send() {
        CheckoutPaymentAPI.applyPaymentMethod(cartId: cartId, priceCart: priceCart, body: body)
        { [weak self] data, error in

            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
    }
}
