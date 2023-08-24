//
//  GuestCheckoutViewState.swift
//  Checkout
//
//  Created on 8/21/23
//

import Foundation
import Violet
import Combine

class GuestCheckoutViewState: ObservableObject {

    @Published var sameAddress: Bool
    @Published var email: String = ""
    @Published var nextEnabled: Bool = false
    
    @Published var billingOrderAddressViewState = OrderAddressViewState(orderAddressType: .billing)
    @Published var shippingOrderAddressViewState = OrderAddressViewState(orderAddressType: .shipping)
    
    let emailPrompt: String = "Email Address *"
    
    @Published var isEmailValid: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(sameAddress: Bool = true) {
        self.sameAddress = sameAddress
        
        $email
            .map { input in
                return OrderAddressViewState.textFieldNotEmpty(input)
                
            }.assign(to: \.isEmailValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest4($isEmailValid, billingOrderAddressViewState.$isAddressValid,
                                  $sameAddress, shippingOrderAddressViewState.$isAddressValid)
            .map { isEmailValid, isBillingAddressValid, useSameAddressShipping, isShippingAddressValid in
                let sameOrShipping = useSameAddressShipping || isBillingAddressValid
                return isEmailValid && isShippingAddressValid && sameOrShipping
            }
            .assign(to: \.nextEnabled, on: self)
            .store(in: &cancellableSet)
    }
    
    func loadFrom(customer: OrderCustomer) {
        Logger.debug("GuestCheckoutViewState - loadFrom: \(customer)")
        if let loadSameAddress = customer.sameAddress {
            Logger.debug("GuestCheckoutViewState: loadSameAddress - \(loadSameAddress)")
            self.sameAddress = loadSameAddress
        }
        if let loadEmail = customer.email,
           loadEmail != email {
            self.email = loadEmail
        }
    }
    func loadFrom(customer: OrderCustomer?, shippingAddress: OrderAddress?, billingAddress: OrderAddress?) {
        if let loadCustomer = customer {
            loadFrom(customer: loadCustomer)
        }
        shippingOrderAddressViewState.loadFrom(orderAddress: shippingAddress)
        billingOrderAddressViewState.loadFrom(orderAddress: billingAddress)
    }
    
    
    
    func produceOrderCustomerBody() -> OrderCustomer? {
        guard nextEnabled, let shippingBody = shippingOrderAddressViewState.produceOrderAddressBody() else {
            return nil
        }
        
        var billingBody: OrderAddress? = nil
        if !sameAddress {
            billingBody = billingOrderAddressViewState.produceOrderAddressBody()
            
        }
        let result = OrderCustomer(billingAddress: billingBody,
                                   email: email,
                                   firstName: shippingOrderAddressViewState.firstName,
                                   lastName: shippingOrderAddressViewState.lastName,
                                   sameAddress: sameAddress,
                                   shippingAddress: shippingBody)
        return result
    }
}

