//
//  DemoAppGuestCheckoutView.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI

/**
 {
         "first_name": "Ishan",
         "last_name": "Wallet Checkout Tests",
         "email": "ishan.guru+test_order@violet.io",
         "shipping_address": {
             "address_1":"",
             "city":"Brooklyn",
             "country":"US",
             "postal_code":"11206",
             "state":"NY",
             "type":"SHIPPING"
         },
         "same_address": true
 }
 
 */
struct DemoAppGuestCheckoutView: View {
    @Binding var store: AppStore
    @ObservedObject var guestCheckoutViewState: GuestCheckoutViewState
    var body: some View {
        ScrollView {
            
            /// BILLINING ADDRESS
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
            /// SAME AS BILLING TOGGLE
            Toggle(isOn: $guestCheckoutViewState.sameAddress) {
                        Text("Same as Billing")
            }.frame(width: 340).padding()
                    
            
            
            /// SHIPPING ADDRESS
            
            
            
            if !guestCheckoutViewState.sameAddress {
                VStack {
                    FormTextField(titleKey: "State", text: $guestCheckoutViewState.state)
                }.padding(.vertical)
            }
            
        }.frame(width: 390).navigationTitle("Guest Checkout").withScrollViewBackgroundColor()

    }
}

struct DemoAppGuestCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                DemoAppGuestCheckoutView(store: AppStore.mockAppStoreBinding,
                                         guestCheckoutViewState: GuestCheckoutViewState(sameAddress: true))
            }.previewDisplayName("Same As Billing")
            
            NavigationStack {
                DemoAppGuestCheckoutView(store: AppStore.mockAppStoreBinding,
                                         guestCheckoutViewState: GuestCheckoutViewState(sameAddress: false))
            }.previewDisplayName("Show Shipping")
        }
    }
}
