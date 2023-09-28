//
//  DemoAppOrderConfirmationView.swift
//  Checkout
//
//  Created on 9/11/23
//

import SwiftUI

struct DemoAppOrderConfirmationView: View {
    @Binding var store: AppStore
    @StateObject var router: Router
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                List {
                    Section {
                        EmptyView()
                    } header: {
                        VStack(spacing: 15) {
                            Text("Payment Successful")
                                .frame(width: 339, alignment: .topLeading)
                                .font(.system(size: 20,weight: .semibold))
                                .foregroundColor(Color.black)
                                .textCase(.none)
                                .padding(0)
                                //.withBlackBorder()
                            Text("Thank you for your order. Review your order details below or continue shopping.")
                                .frame(width: 339, alignment: .topLeading).lineSpacing(10)
                                .font(.system(size: 14))
                                .foregroundColor(Color.black)
                                .textCase(.none)
                                .padding(0)
                                //.withBlackBorder()
                        }
                    }

                    ForEach(cartViewState.bagViewStatesArray) { bagViewState in
                        ReviewBagSection(store: $store,
                                         bagViewState: bagViewState).padding(0)
                    }
                    
                    Section {
                        ReviewEmailAddress(shippingViewState: cartViewState.shippingViewState)
                    }
                    Section {
                        ReviewShippingAddress(shippingViewState: cartViewState.shippingViewState)
                    }
                    
                    ConfirmShippingMethods(cartViewState: cartViewState)
                }
                
                
                
            }
        }
        .navigationTitle("Confirm")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavBarRestartButton(store: $store,
                                    router: router)
            }
        }
    }
}

struct DemoAppOrderConfirmationView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74688()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    static let mockAppStore = AppStore(cartViewState: mockCartViewState)
    
    static var previews: some View {
        NavigationStack {
            DemoAppOrderConfirmationView(store: .constant(mockAppStore),
                                         router: Router(),
                                         cartViewState: mockCartViewState)
        }
    }
}
