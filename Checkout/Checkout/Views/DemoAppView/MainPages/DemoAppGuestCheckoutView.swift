//
//  DemoAppGuestCheckoutView.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI

struct DemoAppGuestCheckoutView: View {
    
    @ObservedObject var guestCheckoutViewState: GuestCheckoutViewState
    var body: some View {
        ScrollView {
        VStack {

            FormTextField(titleKey: "Email", text: $guestCheckoutViewState.email)
            FormTextField(titleKey: "Full Name", text: $guestCheckoutViewState.fullName)

            FormTextField(titleKey: "First Name", text: $guestCheckoutViewState.firstName)
            FormTextField(titleKey: "Last Name", text: $guestCheckoutViewState.lastName)
            FormTextField(titleKey: "Last Name", text: $guestCheckoutViewState.lastName)
            FormTextField(titleKey: "Address 1", text: $guestCheckoutViewState.address1)
            FormTextField(titleKey: "Address 2", text: $guestCheckoutViewState.address2)
            FormTextField(titleKey: "City", text: $guestCheckoutViewState.city)
            }//.formStyle(.grouped)
            

                    
        }.withScrollViewBackgroundColor()
    }
}

struct DemoAppGuestCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppGuestCheckoutView(guestCheckoutViewState: GuestCheckoutViewState())
    }
}
