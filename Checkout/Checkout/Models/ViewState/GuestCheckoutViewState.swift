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
    @Published var nextEnabled: Bool = false
    
    @Published var billingOrderAddressViewState = OrderAddressViewState(orderAddressType: .billing)
    @Published var shippingOrderAddressViewState = OrderAddressViewState(orderAddressType: .shipping)
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(sameAddress: Bool = true) {
        self.sameAddress = sameAddress
        
        Publishers.CombineLatest3(billingOrderAddressViewState.$isAddressValid,
                                  $sameAddress, shippingOrderAddressViewState.$isAddressValid)
            .map { isBillingAddressValid, useSameAddressShipping, isShippingAddressValid in
                let sameOrShipping = useSameAddressShipping || isBillingAddressValid
                return isShippingAddressValid && sameOrShipping
            }
            .assign(to: \.nextEnabled, on: self)
            .store(in: &cancellableSet)
    }
    
    func loadFrom(customer: OrderCustomer) {
        if let loadSameAddress = customer.sameAddress {
            Logger.debug("GuestCheckoutViewState: loadSameAddress - \(loadSameAddress)")
            self.sameAddress = loadSameAddress
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
                                   email: shippingOrderAddressViewState.email,
                                   firstName: shippingOrderAddressViewState.firstName,
                                   lastName: shippingOrderAddressViewState.lastName
                                   ,sameAddress: sameAddress,
                                   shippingAddress: shippingBody)
        return result
    }
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
