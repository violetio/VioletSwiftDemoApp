//
//  GetCartByIDRequest.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import Foundation
import Violet

class GetCartByIDRequest: ProxyAPICall<Order> {
    let orderId: Int64    

    init(orderId: Int64) {
        self.orderId = orderId
        super.init()
    }

    override func send() {
        
        CheckoutCartAPI.getCart(cartId: orderId) { data, error in
            self.callIsCompleted(errorResponse: error, dataResponse: data)
        }
        
    }
}
