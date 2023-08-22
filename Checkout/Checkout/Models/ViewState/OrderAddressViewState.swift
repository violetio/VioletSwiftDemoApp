//
//  OrderAddressViewState.swift
//  Checkout
//
//  Created on 8/22/23
//

import Foundation
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
