//
//  TestCheckoutSequence.swift
//  CheckoutTests
//
//  Created on 3/27/23.
//

import Foundation
import Violet
import Checkout

class TestCheckoutSequence {
    let orderId: Int64
    
    init(orderId: Int64) {
        self.orderId = orderId
    }
    
    func getCartByID_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_GetCartByID_Response.json"
    }

}
