//
//  DemoAppPaymentView.swift
//  Checkout
//
//  Created on 9/5/23
//

import SwiftUI
import StripePaymentSheet

struct DemoAppPaymentView: View {
    
    @State var psIsPresented: Bool = false
    @Binding var store: AppStore
    @StateObject var router: Router
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                List {
                    ForEach(cartViewState.bagViewStatesArray) { bagViewState in
                        ReviewBagSection(store: $store,
                                         bagViewState: bagViewState).padding(0)
                    }
                    
                    Section {
                        ReviewEmailAddress(shippingViewState: cartViewState.shippingViewState)
                    }
                    ReviewShippingAddress(shippingViewState: cartViewState.shippingViewState)
                }
                VStack(alignment: .leading, spacing: 4) {
                    
                    CartAmountDetailLine(detailLabelText: "Subtotal",
                                         amountLabelText: cartViewState.cartSubTotalText)
                    CartAmountDetailLine(detailLabelText: "Shipping",
                                         amountLabelText: cartViewState.cartShippingTotalText)
                    CartAmountDetailLine(detailLabelText: "Tax",
                                         amountLabelText: cartViewState.cartTaxText)
                    CartAmountDetailLine(detailLabelText: "Total",
                                         amountLabelText: cartViewState.cartFullTotalText, fontWeight: .semibold)
                    
                    
                        
                }.frame(width: 340,
                        height: 150)//.withScrollViewBackgroundColor().withBlackBorder()
                
                PaymentSheetPresentView(store: $store,
                                        cartViewState: cartViewState)
            }
        }
        .navigationTitle("Review")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavBarCartButton(store: $store,
                                 cartViewState: store.cartViewState,
                                 router: router)
            }
        }
    }
}

struct DemoAppPaymentView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    static let mockAppStore = AppStore(cartViewState: mockCartViewState)
    
    static var previews: some View {
        NavigationStack {
            DemoAppPaymentView(store: .constant(mockAppStore),
                               router: Router(),
                               cartViewState: mockCartViewState)
        }
    }
}
