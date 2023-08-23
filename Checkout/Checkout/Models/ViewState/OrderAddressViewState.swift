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
    @Published var isLastNameValid: Bool = false
    @Published var isAddress1Valid: Bool = false
    @Published var isCityValid: Bool = false
    @Published var isStateValid: Bool = false
    @Published var isCountryValid: Bool = false
    @Published var isPostalCodeValid: Bool = false
    @Published var isPhoneValid: Bool = false
    @Published var email_name_address1_valid = false
    @Published var city_state_postalCode_country_valid =  false
    @Published var isAddressValid: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(orderAddressType: OrderAddress.ModelType = .billing) {
        self.orderAddressType = orderAddressType
        
        $email
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isEmailValid, on: self)
            .store(in: &cancellableSet)
        
        $firstName
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isFirstNameValid, on: self)
            .store(in: &cancellableSet)
        
        $lastName
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isLastNameValid, on: self)
            .store(in: &cancellableSet)
        
        $address1
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isAddress1Valid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest4($isEmailValid, $isFirstNameValid, $isLastNameValid, $isAddress1Valid)
            .map { email, first, last, address1 in
                return email && first && last && address1
            }.assign(to: \.email_name_address1_valid, on: self)
            .store(in: &cancellableSet)
        
        
        $city
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isCityValid, on: self)
            .store(in: &cancellableSet)
        
        $state
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isStateValid, on: self)
            .store(in: &cancellableSet)
        
        $postalCode
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isPostalCodeValid, on: self)
            .store(in: &cancellableSet)
        
        $country
            .map { input in
                return Self.textFieldNotEmpty(input)
                
            }.assign(to: \.isCountryValid, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest4($isCityValid, $isStateValid, $isPostalCodeValid, $isCountryValid).map {
            return $0 && $1 && $2 && $3
        }.assign(to: \.city_state_postalCode_country_valid, on: self)
            .store(in: &cancellableSet)
        
        
        
        Publishers.CombineLatest($email_name_address1_valid, $city_state_postalCode_country_valid).map {
            return $0 && $1
        }.assign(to: \.isAddressValid, on: self)
            .store(in: &cancellableSet)
        
        
    }
    
    func produceOrderAddressBody() -> OrderAddress? {
        guard isAddressValid else {
            return nil
        }
        let result = OrderAddress(address1: address1,
                                  address2: address2,
                                  city: city,
                                  country: country,
                                  email: email,
                                  phone: phone,
                                  postalCode: postalCode,
                                  state: state,
                                  type: orderAddressType)
        return result
    }
    
    static func textFieldNotEmpty(_ input: String) -> Bool {
        return !input.isEmpty
    }
}
