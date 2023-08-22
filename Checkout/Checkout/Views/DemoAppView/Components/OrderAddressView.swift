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
            if orderAddressViewState.orderAddressType == .shipping {
                Text("Shipping Address")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.vertical)
            } else {
                Text("Billiing Address")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.vertical)
            }
            FormTextField(titleKey: orderAddressViewState.emailPrompt, text: $orderAddressViewState.email)
            FormTextField(titleKey: orderAddressViewState.firstNamePrompt, text: $orderAddressViewState.firstName)
            FormTextField(titleKey: orderAddressViewState.lastNamePrompt, text: $orderAddressViewState.lastName)
            FormTextField(titleKey: orderAddressViewState.addressLine1Prompt, text: $orderAddressViewState.address1)
            //            FormTextField(titleKey: "Address 2", text: $orderAddressViewState.address2)
            FormTextField(titleKey: orderAddressViewState.cityPrompt, text: $orderAddressViewState.city)
            FormTextField(titleKey: orderAddressViewState.countryPrompt, text: $orderAddressViewState.country)
            FormTextField(titleKey: orderAddressViewState.postalCodePrompt, text: $orderAddressViewState.postalCode)
            FormTextField(titleKey: orderAddressViewState.statePrompt, text: $orderAddressViewState.state)
        }
    }
}

struct OrderAddressView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAddressView(orderAddressViewState: OrderAddressViewState())
    }
}
