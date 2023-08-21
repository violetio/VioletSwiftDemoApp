//
//  GuestCheckoutViewState.swift
//  Checkout
//
//  Created on 8/21/23
//

import Foundation
import Violet

class GuestCheckoutViewState: ObservableObject {
    @Published var email: String = ""
    @Published var fullName: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var address1: String = ""
    @Published var address2: String = ""
    @Published var sameAddress: Bool = true
    @Published var city: String = ""
    @Published var state: String = ""
    @Published var postalCode: String = ""
    @Published var county: String = ""
    init() {}
}

/**
 
 public struct OrderCustomer: Codable, JSONEncodable, Hashable {

     public var billingAddress: OrderAddress?
     /** Email Address of Customer */
     public var email: String?
     /** ID of the Customer on the External Platform */
     public var externalId: String?
     /** First Name */
     public var firstName: String?
     /** Last Name */
     public var lastName: String?
     public var name: String?
     /** Use Same Address for Both */
     public var sameAddress: Bool?
     public var shippingAddress: OrderAddress?
     /** ID of the User the Order Customer references */
     public var userId: Int64?
 */

/**
 public struct OrderAddress: Codable, JSONEncodable, Hashable {

     public enum ModelType: String, Codable, CaseIterable {
         case shipping = "SHIPPING"
         case billing = "BILLING"
     }
     /** First line of the Address */
     public var address1: String?
     /** Second line of the Address */
     public var address2: String?
     /** City */
     public var city: String?
     /** Country ISO2 Code */
     public var country: String?
     /** Email Address */
     public var email: String?
     public var firstName: String?
     public var lastName: String?
     /** Name on Address */
     public var name: String?
     /** Phone Number */
     public var phone: String?
     /** Postal/Zip Code */
     public var postalCode: String?
     /** State Abbreviation */
     public var state: String?
     /** Address Type */
     public var type: ModelType?
 */
