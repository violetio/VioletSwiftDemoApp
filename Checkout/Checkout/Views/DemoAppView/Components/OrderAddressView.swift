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
            FormTextField(titleKey: "Email", text: $orderAddressViewState.email)
            FormTextField(titleKey: "First Name", text: $orderAddressViewState.firstName)
            FormTextField(titleKey: "Last Name", text: $orderAddressViewState.lastName)
            FormTextField(titleKey: "Address 1", text: $orderAddressViewState.address1)
            //            FormTextField(titleKey: "Address 2", text: $orderAddressViewState.address2)
            FormTextField(titleKey: "City", text: $orderAddressViewState.city)
            FormTextField(titleKey: "Country", text: $orderAddressViewState.country)
            FormTextField(titleKey: "Postal Code", text: $orderAddressViewState.postalCode)
            FormTextField(titleKey: "State", text: $orderAddressViewState.state)
        }
    }
}

struct OrderAddressView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAddressView(orderAddressViewState: OrderAddressViewState())
    }
}
