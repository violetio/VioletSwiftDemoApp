//
//  TestCheckoutSequence.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/27/23.
//

import Foundation
import Violet
import Checkout

class TestCheckoutSequence {
    let orderId: Int64
    
    init(orderId: Int64) {
        self.orderId = orderId
    }
    
    static func Order_ID_58374() -> TestCheckoutSequence {
        return TestCheckoutSequence(orderId: 58374)
    }
    //
    static func Order_ID_59087() -> TestCheckoutSequence {
        return TestCheckoutSequence(orderId: 59087)
    }

    func shippingAvailable_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_ShippingAvailable_Response.json"
    }

    func cartCustomerPostAvailable_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_CustomerPost_Response.json"
    }

    func paymentIntentBased_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_PaymentPost_Response.json"
    }

    func createCart_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_CreateCart_Response.json"
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
