//
//  DemoAppGuestCheckoutView.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI
import Violet

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
            
            /// SHIPPING ADDRESS
            /// VStack(alignment: .leading) {
            
            OrderAddressView(orderAddressViewState: guestCheckoutViewState.shippingOrderAddressViewState)
            
            
            /// BILLING ADDRESS
            if !guestCheckoutViewState.sameAddress {
                VStack(alignment: .leading) {
                    
                    OrderAddressView(orderAddressViewState: guestCheckoutViewState.billingOrderAddressViewState)
                }.padding(0)
            }
            
            /// SAME AS BILLING TOGGLE
            Toggle(isOn: $guestCheckoutViewState.sameAddress) {
                        Text("Shipping same as Billing")
            }.frame(width: 340).padding().tint(.blue)
            
            Button {
                if let orderCustomer = guestCheckoutViewState.produceOrderCustomerBody(),
                   let orderId = store.state.cartViewState.cartId {
                    Logger.debug("DemoAppGuestCheckoutView: Next Button Send OrderCustomer")
                    Logger.debug("DemoAppGuestCheckoutView: OrderId - \(orderId)")
                    Logger.debug("DemoAppGuestCheckoutView: orderCustomer - \(orderCustomer)")
                    //store.sender.send(.updateCartCustomerRequest(orderId, orderCustomer))
                }


            } label: {
                if guestCheckoutViewState.nextEnabled {
                    Text("Next")
                        .font(Font.custom("SF Pro Text", size: 17))
                        .frame(width: 340, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 0, green: 0.48, blue: 1))
                        .cornerRadius(12)
                } else {
                    Text("Next")
                        .font(Font.custom("SF Pro Text", size: 17))
                        .frame(width: 340, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 0.47, green: 0.47, blue: 0.5).opacity(0.16))
                        .cornerRadius(12)
                }
            }
            .frame(width: 340, alignment: .bottom).padding()
            
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
