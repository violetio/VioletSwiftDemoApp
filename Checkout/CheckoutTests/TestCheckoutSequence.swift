//
//  TestCheckoutSequence.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/27/23.
//

import Foundation
import VioletPublicClientAPI
import Checkout

class TestCheckoutSequence {
    let orderId: Int64
    
    init(orderId: Int64) {
        self.orderId = orderId
    }
    
    static func Order_ID_58374() -> TestCheckoutSequence {
        return TestCheckoutSequence(orderId: 58374)
    }
    
    /**
        Looking for:
        "stripe_key":  String,
        "payment_intent_client_secret": String
        "intent_based_checkout": Bool,
        !! NONE of  these currently visible from OpenAPI Spec
     */
    func captureIntentBasedCheckout(_ order: Order) {
        
    }
}
