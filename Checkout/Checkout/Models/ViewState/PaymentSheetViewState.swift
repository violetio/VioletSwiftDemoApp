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
    @Published var psIsPresented: Bool = false
    @Published var paymentSheet: PaymentSheet? = nil
    @Published var paymentResult: PaymentSheetResult? = nil
    @Published var paymentConfiguration: PaymentSheet.Configuration
    @Published var applePayConfiguration: PaymentSheet.ApplePayConfiguration? = nil
    @Published var payment_intent_client_secret: String? = nil

    
    init(new_payment_intent_client_secret: String? = nil, bagCount: Int = 0) {
        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = "Violet Demo Merchant"
        configuration.style = .alwaysLight
        self.paymentConfiguration = configuration
        if let client_secret = new_payment_intent_client_secret {
            update(payment_intent_client_secret: client_secret, bagCount: bagCount)
        }
    }
    
    func update(payment_intent_client_secret: String, bagCount: Int) {
        self.payment_intent_client_secret = payment_intent_client_secret
        Logger.debug("payment_intent_client_secret: \(payment_intent_client_secret)")
        
        if bagCount <= 1 {
            self.applePayConfiguration = Self.applePayConfiguration()
            paymentConfiguration.applePay = self.applePayConfiguration
        } else {
            paymentConfiguration.applePay = nil
        }
        var newPaymentSheet = PaymentSheet(paymentIntentClientSecret: payment_intent_client_secret, configuration: paymentConfiguration)
        
        self.paymentSheet = newPaymentSheet
    }
    
    static func applePayConfiguration(merchantId: String = "io.violet", merchantCountryCode: String = "US") -> PaymentSheet.ApplePayConfiguration {
        let config = PaymentSheet.ApplePayConfiguration(merchantId: merchantId, merchantCountryCode: merchantCountryCode, buttonType: .buy)
        return config
    }
    
}
