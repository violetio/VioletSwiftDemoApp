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
    @ObservedObject var cartViewState: CartViewState
    @StateObject var router: Router
    
    var body: some View {
        ScrollView {
            
            /// SHIPPING ADDRESS
            VStack(alignment: .leading) {
                if cartViewState.bagCount == 1 {
                    InstantPaymentSheetPresentView(store: $store,
                                                   cartViewState: cartViewState,
                                                   selectedSkuID: .constant(nil),
                                                   hasPaymentIntent: $cartViewState.paymentSheetViewState.hasPaymentIntent)
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
            
            NextButton(nextEnabled: $shippingViewState.nextEnabled) {
                if let orderId = store.state.cartViewState.cartId {
                    if store.cartViewState.checkoutPagesComplete.contains(.addShippingAddress) {
                        self.store.send(.fetchShippingMethods(orderId))
                        
                        
                    } else {
                        if let orderCustomer = shippingViewState.produceOrderCustomerBody() {
                            store.sender.send(.updateCartCustomerRequest(orderId, orderCustomer))
                            store.send(.requestIntentBasedCapture(orderId))
                        }
                    }
                }
            }.frame(width: 340, alignment: .bottom).padding()

            .frame(width: 340, alignment: .bottom).padding()
            
        }.frame(width: 390)
            .navigationTitle("Guest Checkout")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavBarCartButton(store: $store,
                                     cartViewState: store.cartViewState,
                                     router: router)
                }
            }
            .withScrollViewBackgroundColor()
            
            .onAppear {
                if shippingViewState.orderHasAddress {
                    Logger.debug("Order has Address")
                }
                    
            }

    }
}

struct DemoAppGuestCheckoutView_Previews: PreviewProvider {
    static let mockOrder_NoBags = MockOffers.load_OrderID_73938()!
    static let mockOrder_1Bag = MockOffers.load_OrderID_71169()!
    static let mockCartViewState_NoBags = CartViewState(order: mockOrder_NoBags)
    static let mockCartViewState_1Bag = CartViewState(order: mockOrder_1Bag)
    
    static var previews: some View {
        Group {
            NavigationStack {
                DemoAppGuestCheckoutView(store: AppStore.mockAppStoreBinding,
                                         shippingViewState: ShippingViewState(sameAddress: true),
                                         cartViewState: mockCartViewState_NoBags,
                                         router: Router())
            }.previewDisplayName("Same As Billing")
            
            NavigationStack {
                DemoAppGuestCheckoutView(store: AppStore.mockAppStoreBinding,
                                         shippingViewState: ShippingViewState(sameAddress: false),
                                         cartViewState: mockCartViewState_NoBags,
                                         router: Router())
            }.previewDisplayName("Show Shipping")
            
            NavigationStack {
                DemoAppGuestCheckoutView(store: AppStore.mockAppStoreBinding,
                                         shippingViewState: ShippingViewState(sameAddress: true),
                                         cartViewState: mockCartViewState_1Bag,
                                         router: Router())
            }.previewDisplayName("1 Bag Apple Pay")
        }
    }
}
