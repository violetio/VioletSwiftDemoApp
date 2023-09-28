//
//  CheckoutCartPostRequest.swift
//  Checkout
//
//  Created on 3/23/23.
//

import Violet

class CreateCartRequest: ProxyAPICall<Order> {
    let cartInitializationRequest: CartInitializationRequest
    let baseCurrency: String

    init(cartInitializationRequest: CartInitializationRequest, baseCurrency: String = "USD") {
        self.cartInitializationRequest = cartInitializationRequest
        self.baseCurrency = baseCurrency
        super.init()
    }

    override func send() {
         CheckoutCartAPI.createCart(baseCurrency: baseCurrency,
                                    body: cartInitializationRequest) { [weak self] data, error in
            guard let weakSelf = self else { return }
            weakSelf.callIsCompleted(errorResponse: error, dataResponse: data)
        }
        
    }
}
