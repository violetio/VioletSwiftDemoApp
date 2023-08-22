//
//  OrderAddressView.swift
//  Checkout
//
//  Created on 8/22/23
//

import SwiftUI

struct OrderAddressView: View {
    @ObservedObject var guestCheckoutViewState: GuestCheckoutViewState
    
    var body: some View {
        VStack {
            FormTextField(titleKey: "Email", text: $guestCheckoutViewState.email)
            FormTextField(titleKey: "First Name", text: $guestCheckoutViewState.firstName)
            FormTextField(titleKey: "Last Name", text: $guestCheckoutViewState.lastName)
            FormTextField(titleKey: "Address 1", text: $guestCheckoutViewState.address1)
            //            FormTextField(titleKey: "Address 2", text: $guestCheckoutViewState.address2)
            FormTextField(titleKey: "City", text: $guestCheckoutViewState.city)
            FormTextField(titleKey: "Country", text: $guestCheckoutViewState.country)
            FormTextField(titleKey: "Postal Code", text: $guestCheckoutViewState.postalCode)
            FormTextField(titleKey: "State", text: $guestCheckoutViewState.state)
        }
    }
}

struct OrderAddressView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAddressView(guestCheckoutViewState: GuestCheckoutViewState())
    }
}
