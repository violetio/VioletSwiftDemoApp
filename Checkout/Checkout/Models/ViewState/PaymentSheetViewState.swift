//
//  PaymentSheetViewState.swift
//  Checkout
//
//  Created on 9/6/23
//

import Foundation
import SwiftUI
import StripePaymentSheet
import Violet

class PaymentSheetViewState: ObservableObject {
    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?

    init(order: Order? = nil) {
        update(order: order)
    }
    
    init(new_payment_intent_client_secret: String) {
        update(payment_intent_client_secret: new_payment_intent_client_secret)
    }
    
    var configuration: PaymentSheet.Configuration {
        var configuration = PaymentSheet.Configuration()
//        configuration.merchantDisplayName = "Violet Demo Merchant"
//        configuration.applePay = nil
        return configuration
    }
    
    func update(payment_intent_client_secret: String) {
        self.paymentSheet = PaymentSheet(paymentIntentClientSecret: payment_intent_client_secret, configuration: configuration)
    }
    
    func update(order: Order? = nil) {
        guard order != nil else {
            Logger.debug("No Order")
            return
        }
        if let payment_intent_client_secret = order?.paymentIntentClientSecret {
            update(payment_intent_client_secret: payment_intent_client_secret)
        } else {
            Logger.debug("No paymentIntent")
        }
    
    }
    
}
