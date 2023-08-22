//
//  OrderAddressViewState.swift
//  Checkout
//
//  Created on 8/22/23
//

import SwiftUI
import Violet

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

    
    init(orderAddressType: OrderAddress.ModelType = .billing) {
        self.orderAddressType = orderAddressType
    }
}

/**
 public enum ModelType: String, Codable, CaseIterable {
     case shipping = "SHIPPING"
     case billing = "BILLING"
 }

 
 

 /** Address Type */
 public var type: ModelType?
 */
