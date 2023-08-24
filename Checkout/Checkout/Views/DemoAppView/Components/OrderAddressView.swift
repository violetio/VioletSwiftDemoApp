//
//  OrderAddressView.swift
//  Checkout
//
//  Created on 8/22/23
//

import SwiftUI

struct OrderAddressView: View {
    @ObservedObject var orderAddressViewState: OrderAddressViewState
    
    var body: some View {
        VStack(alignment: .leading) {
//            if orderAddressViewState.orderAddressType == .shipping {
//                Text("Shipping Address")
//                    .font(.system(size: 17, weight: .semibold))
//                    .padding(.vertical)
//            } else {
//                Text("Billing Address")
//                    .font(.system(size: 17, weight: .semibold))
//                    .padding(.vertical)
//            }
            
            FormTextField(orderAddressViewState.firstNamePrompt, text: $orderAddressViewState.firstName)
            FormTextField(orderAddressViewState.lastNamePrompt, text: $orderAddressViewState.lastName)
            FormTextField(orderAddressViewState.addressLine1Prompt, text: $orderAddressViewState.address1)
            FormTextField(orderAddressViewState.addressLine2Prompt, text: $orderAddressViewState.address2)
            FormTextField(orderAddressViewState.cityPrompt, text: $orderAddressViewState.city)
            FormTextField(orderAddressViewState.countryPrompt, text: $orderAddressViewState.country)
            FormTextField(orderAddressViewState.postalCodePrompt, text: $orderAddressViewState.postalCode)
            FormTextField(orderAddressViewState.statePrompt, text: $orderAddressViewState.state)
        }
    }
}

struct OrderAddressView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAddressView(orderAddressViewState: OrderAddressViewState())
    }
}
