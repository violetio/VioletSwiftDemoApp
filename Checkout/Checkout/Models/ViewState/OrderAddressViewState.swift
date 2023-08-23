//
//  OrderAddressViewState.swift
//  Checkout
//
//  Created on 8/22/23
//

import SwiftUI
import Violet
import Combine

/**
 
 */
class OrderAddressViewState: ObservableObject {
    @Published var address1: String = ""
    @Published var address2: String = ""
    @Published var city: String = ""
    /** Country ISO2 Code */
    @Published var country: String = ""
    @Published var email: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var postalCode: String = ""
    
    @Published var state: String = ""
    @Published var orderAddressType: OrderAddress.ModelType = .billing
    
    let emailPrompt: String = "Email Address *"
    let firstNamePrompt: String = "First Name *"
    let lastNamePrompt: String = "Last Name *"
    let addressLine1Prompt: String = "Address Line 1 *"
    let addressLine2Prompt: String = "Address Line 2"
    let cityPrompt: String = "City *"
    let statePrompt: String = "State *"
    let countryPrompt: String = "Country *"
    let postalCodePrompt: String = "Postal Code *"

    
    
    @Published var isEmailValid: Bool = false
    @Published var isFirstNameValid: Bool = false
    @Published var canSubmit: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(orderAddressType: OrderAddress.ModelType = .billing) {
        self.orderAddressType = orderAddressType
        $email
            .map { email in
                return Self.textFieldNotEmpty(email)
                
            }.assign(to: \.isEmailValid, on: self)
            .store(in: &cancellableSet)
        
        $firstName
            .map { firstName in
                return Self.textFieldNotEmpty(firstName)
                
            }.assign(to: \.isFirstNameValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($isEmailValid, $isFirstNameValid)
            .map {
                return $0 && $1
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
    
    static func textFieldNotEmpty(_ input: String) -> Bool {
        return !input.isEmpty
    }
}
