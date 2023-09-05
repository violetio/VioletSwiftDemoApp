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
    
    static func Order_ID_58374() -> TestCheckoutSequence {
        return TestCheckoutSequence(orderId: 58374)
    }
    //
    static func Order_ID_59087() -> TestCheckoutSequence {
        return TestCheckoutSequence(orderId: 59087)
    }
    
    func submitCart_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_SubmitCart_Response.json"
    }
    
    func applyShipping_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_ApplyShipping_Response.json"
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
    
    func getCartByID_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_GetCartByID_Response.json"
    }
    
    func addSkuToCart_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_AddSkuToCart_Response.json"
    }
    
    func updateSkuInCart_Response_jsonResponseFileName() -> String {
        return "Order_ID_" + String(self.orderId) + "_UpdateSkuInCart_Response.json"
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
