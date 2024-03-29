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
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var name: String = ""
    @Published var phone: String = ""
    @Published var postalCode: String = ""
    
    @Published var state: String = ""
    @Published var orderAddressType: OrderAddress.ModelType = .billing
    
    let firstNamePrompt: String = "First Name *"
    let lastNamePrompt: String = "Last Name *"
    let addressLine1Prompt: String = "Address Line 1 *"
    let addressLine2Prompt: String = "Address Line 2"
    let cityPrompt: String = "City *"
    let statePrompt: String = "State *"
    let countryPrompt: String = "Country *"
    let postalCodePrompt: String = "Postal Code *"

    @Published var isFirstNameValid: Bool = false
    @Published var isLastNameValid: Bool = false
    @Published var isAddress1Valid: Bool = false
    @Published var isCityValid: Bool = false
    @Published var isStateValid: Bool = false
    @Published var isCountryValid: Bool = false
    @Published var isPostalCodeValid: Bool = false
    @Published var isPhoneValid: Bool = false
    @Published var name_address1_valid = false
    @Published var city_state_postalCode_country_valid =  false
    @Published var isAddressValid: Bool = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(orderAddressType: OrderAddress.ModelType = .billing) {
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            Logger.debug("countryCode: \(countryCode)")
            self.country = countryCode
        }
        self.orderAddressType = orderAddressType
        
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
        
        Publishers.CombineLatest3($isFirstNameValid, $isLastNameValid, $isAddress1Valid)
            .map { first, last, address1 in
                return first && last && address1
            }.assign(to: \.name_address1_valid, on: self)
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
        
        
        
        Publishers.CombineLatest($name_address1_valid, $city_state_postalCode_country_valid).map {
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
                                  phone: phone,
                                  postalCode: postalCode,
                                  state: state,
                                  type: orderAddressType)
        return result
    }
    
    func loadFrom(orderAddress: OrderAddress?) {
//        Logger.debug("OrderAddressViewState - loadFrom: \(orderAddress)")
        
        
        if let loadFirstName = orderAddress?.firstName,
           loadFirstName != firstName {
            self.firstName = loadFirstName
        }
        
        if let loadLastName = orderAddress?.lastName,
           loadLastName != lastName {
            self.lastName = loadLastName
        }
        
        if let fullName = orderAddress?.name {
            self.name = fullName
        }
        
        if let loadAddress1 = orderAddress?.address1,
           loadAddress1 != address1 {
            self.address1 = loadAddress1
        }

        if let loadAddress2 = orderAddress?.address2,
           loadAddress2 != address2 {
            self.address2 = loadAddress2
        }
        
        if let loadCity = orderAddress?.city,
           loadCity != city {
            self.city = loadCity
        }
        
        if let loadState = orderAddress?.state,
           loadState != state {
            self.state = loadState
        }

        if let loadCountry = orderAddress?.country,
           loadCountry != country {
            self.country = loadCountry
        }
        
        if let loadPostalCode = orderAddress?.postalCode,
           loadPostalCode != postalCode {
            self.postalCode = loadPostalCode
        }
        
        if let loadPhone = orderAddress?.phone,
           loadPhone != phone {
            self.phone = loadPhone
        }

    }
    
    static func textFieldNotEmpty(_ input: String) -> Bool {
        return !input.isEmpty
    }
}
