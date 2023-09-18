//
//  PaymentSheetViewState.swift
//  Checkout
//
//  Created on 9/6/23
//

import Combine
import Foundation
import PassKit
import SwiftUI
import StripePaymentSheet
import Violet

class PaymentSheetViewState: ObservableObject {
    
    @Published var paymentSheet: PaymentSheet? = nil
    @Published var paymentResult: PaymentSheetResult? = nil
    @Published var paymentConfiguration: PaymentSheet.Configuration
    @Published var applePayConfiguration: PaymentSheet.ApplePayConfiguration? = nil
    @Published var payment_intent_client_secret: String? = nil
    @Published var hasPaymentIntent: Bool = false

    private var cancellableSet: Set<AnyCancellable> = []
    
    init(new_payment_intent_client_secret: String? = nil, bagCount: Int = 0) {
        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = "Violet Demo Merchant"

        self.paymentConfiguration = configuration
        if let client_secret = new_payment_intent_client_secret {
            update(payment_intent_client_secret: client_secret, bagCount: bagCount)
        }
    }
    
    func update(payment_intent_client_secret: String?, bagCount: Int) {
        self.payment_intent_client_secret = payment_intent_client_secret
        guard let found_client_secret = payment_intent_client_secret else {
            self.applePayConfiguration = nil
            self.paymentSheet = nil
            self.hasPaymentIntent = false
            return
        }
        //Logger.debug("payment_intent_client_secret: \(payment_intent_client_secret)")
        
        if bagCount <= 1 {
            self.applePayConfiguration = self.applePayConfiguration()
            paymentConfiguration.applePay = self.applePayConfiguration
        } else {
            paymentConfiguration.applePay = nil
        }
        
        if self.paymentSheet == nil {
            let newPaymentSheet = PaymentSheet(paymentIntentClientSecret: found_client_secret,
                                               configuration: paymentConfiguration)
            self.paymentSheet = newPaymentSheet
            //Logger.debug("Created .paymentSheet")
        }
//        else {
//            Logger.debug("Existing .paymentSheet")
//        }
        self.hasPaymentIntent = true
    }

    func applePayConfiguration(merchantId: String = "io.violet", merchantCountryCode: String = "US", useCustomHandlers: Bool = false) -> PaymentSheet.ApplePayConfiguration {
        let customHandlers: PaymentSheet.ApplePayConfiguration.Handlers? = useCustomHandlers ? customHandlers() : nil

        let config = PaymentSheet.ApplePayConfiguration(merchantId: merchantId,
                                                        merchantCountryCode: merchantCountryCode,
                                                        buttonType: .buy,
                                                        customHandlers: customHandlers)
        

        return config
    }
    
    static let RequiredShippingContactFields: Set<PKContactField> = [.name,.emailAddress,.postalAddress]
    func customHandlers() -> PaymentSheet.ApplePayConfiguration.Handlers {
        let customHandlers = PaymentSheet.ApplePayConfiguration.Handlers { request in
            request.requiredShippingContactFields = Self.RequiredShippingContactFields
            return request
        } authorizationResultHandler: { result, completion in
            completion(result)
        }
        return customHandlers
    }
    
}
