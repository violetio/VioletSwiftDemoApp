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
    typealias PKPaymentAuthorizationResultHandler = (PKPaymentAuthorizationResult) -> Void
    @Published var paymentSheet: PaymentSheet? = nil
    @Published var paymentResult: PaymentSheetResult? = nil
    @Published var paymentConfiguration: PaymentSheet.Configuration
    @Published var applePayConfiguration: PaymentSheet.ApplePayConfiguration? = nil
    @Published var payment_intent_client_secret: String? = nil
    @Published var hasPaymentIntent: Bool = false
    var paymentAuthorizationResultHandler: PKPaymentAuthorizationResultHandler? = nil

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
        var secret_changed = false
        if let current_secret = self.payment_intent_client_secret,
           let new_secret = payment_intent_client_secret,
           current_secret != new_secret {
            secret_changed = true
        }
        self.payment_intent_client_secret = payment_intent_client_secret
        guard let found_client_secret = payment_intent_client_secret else {
            self.applePayConfiguration = nil
            self.paymentSheet = nil
            self.hasPaymentIntent = false
            return
        }
        
        if bagCount <= 1 {
            self.applePayConfiguration = self.applePayConfiguration(usage: [.resultSubmitOrder])
            paymentConfiguration.applePay = self.applePayConfiguration
        } else {
            paymentConfiguration.applePay = nil
        }
        
        if self.paymentSheet == nil || secret_changed {
            let newPaymentSheet = PaymentSheet(paymentIntentClientSecret: found_client_secret,
                                               configuration: paymentConfiguration)
            self.paymentSheet = newPaymentSheet
        }
        self.hasPaymentIntent = true
    }

    func applePayConfiguration(merchantId: String = "io.violet", merchantCountryCode: String = "US", usage: CustomHandlerUsage = []) -> PaymentSheet.ApplePayConfiguration {
        let customHandlers: PaymentSheet.ApplePayConfiguration.Handlers? = !usage.isEmpty ? customHandlers(usage: usage) : nil

        let config = PaymentSheet.ApplePayConfiguration(merchantId: merchantId,
                                                        merchantCountryCode: merchantCountryCode,
                                                        buttonType: .buy,
                                                        customHandlers: customHandlers)
        

        return config
    }
    
    struct CustomHandlerUsage: OptionSet {
        let rawValue: Int
        static let requireShippingContact = CustomHandlerUsage(rawValue: 1<<0)
        static let resultSubmitOrder = CustomHandlerUsage(rawValue: 1<<1)
    
    }
    static let RequiredShippingContactFields: Set<PKContactField> = [.name,.emailAddress,.postalAddress]
    func customHandlers(usage: CustomHandlerUsage = []) -> PaymentSheet.ApplePayConfiguration.Handlers {
        let customHandlers = PaymentSheet.ApplePayConfiguration.Handlers { request in
            if usage.contains(.requireShippingContact) {
                request.requiredShippingContactFields = Self.RequiredShippingContactFields
            }
            return request
        } authorizationResultHandler: { result, completion in
            if usage.contains(.resultSubmitOrder) {
                switch result.status {
                case .success:
                    Logger.debug("authorizationResultHandler .success")
                default:
                    Logger.debug("authorizationResultHandler \(result.status)")
                
                }
                self.paymentAuthorizationResultHandler?(result)
            }
            completion(result)
        }
        return customHandlers
    }
    
}
