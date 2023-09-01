//
//  DemoAppGuestCheckoutView.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI
import Violet
import StripeApplePay

/**

 */
struct DemoAppGuestCheckoutView: View {
    @Binding var store: AppStore
    @ObservedObject var shippingViewState: ShippingViewState
    @StateObject var router: Router
    
    var body: some View {
        ScrollView {
            
            /// SHIPPING ADDRESS
            VStack(alignment: .leading) {
                if store.cartViewState.bagCount <= 1 {
                    if StripeAPI.deviceSupportsApplePay() {
                        //Font 17
                        PaymentButton(action: applePayButtonAction)
                            
                            .frame(width: 340, height: 44).padding(.top)
                    } else {
                        Text("Device does not support Apple Pay")
                    }
                } else {
                    Text("NO Apply Pay")
                }
                    
                
                Text("Shipping Address")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.vertical)
                FormTextField(shippingViewState.emailPrompt,
                              text: $shippingViewState.email)
                OrderAddressView(orderAddressViewState: shippingViewState.shippingOrderAddressViewState)
            }.padding(0)
            /// SAME AS BILLING TOGGLE
            Toggle(isOn: $shippingViewState.sameAddress) {
                        Text("Shipping same as Billing")
            }.frame(width: 340).padding().tint(.blue)
            
            /// BILLING ADDRESS
            if !shippingViewState.sameAddress {
                VStack(alignment: .leading) {
                    Text("Billing Address")
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.vertical)
                    OrderAddressView(orderAddressViewState: shippingViewState.billingOrderAddressViewState)
                }.padding(0)
            }
            
            Button {
                if let orderId = store.state.cartViewState.cartId {
                    if store.cartViewState.checkoutPagesComplete.contains(.addShippingAddress) {
                        self.store.send(.fetchShippingMethods(orderId))
                        //router.paths.append(NavigationKey.selectShippingMethod)
                    } else {
                        if let orderCustomer = shippingViewState.produceOrderCustomerBody() {
                            Logger.debug("DemoAppGuestCheckoutView: Next Button Send OrderCustomer")
                            Logger.debug("DemoAppGuestCheckoutView: OrderId - \(orderId)")
                            Logger.debug("DemoAppGuestCheckoutView: orderCustomer - \(orderCustomer)")
                            store.sender.send(.updateCartCustomerRequest(orderId, orderCustomer))
                        }
                    }
                }


            } label: {
                if shippingViewState.nextEnabled {
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
            
        }.frame(width: 390)
            .navigationTitle("Guest Checkout").toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Test") {
//                        shippingViewState.shippingOrderAddressViewState.email = "alan+sandbox@violet.io"
                        shippingViewState.shippingOrderAddressViewState.firstName = "Sandy"
                        shippingViewState.shippingOrderAddressViewState.lastName = "Box"
                        shippingViewState.shippingOrderAddressViewState.address1 = "999 Meseroles Street"
                        shippingViewState.shippingOrderAddressViewState.city = "Brooklyn"
                        shippingViewState.shippingOrderAddressViewState.state = "NY"
                        shippingViewState.shippingOrderAddressViewState.country = "US"
                        shippingViewState.shippingOrderAddressViewState.postalCode = "11237"
                        
                    }
                }
            }
            .withScrollViewBackgroundColor()
            .onAppear {
                if shippingViewState.orderHasAddress {
                    Logger.debug("Order has Address")
                }
                    
            }

    }
    
    func applePayButtonAction() {
        Logger.info("Apple Pay Button Tapped!")
    }
}

struct DemoAppGuestCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                DemoAppGuestCheckoutView(store: AppStore.mockAppStoreBinding,
                                         shippingViewState: ShippingViewState(sameAddress: true), router: Router())
            }.previewDisplayName("Same As Billing")
            
            NavigationStack {
                DemoAppGuestCheckoutView(store: AppStore.mockAppStoreBinding,
                                         shippingViewState: ShippingViewState(sameAddress: false),
                                         router: Router())
            }.previewDisplayName("Show Shipping")
        }
    }
}
