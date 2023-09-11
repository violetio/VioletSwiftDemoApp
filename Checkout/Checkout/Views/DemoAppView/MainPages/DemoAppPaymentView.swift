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
                
                if let ps: PaymentSheet = cartViewState.paymentSheetViewState?.paymentSheet {
                    
                    NextButton(buttonText: "Pay", nextEnabled: .constant(true)) {
                        psIsPresented = true
                        Logger.debug("psIsPresented: \(psIsPresented)")
                    }.paymentSheet(isPresented: $psIsPresented,
                                   paymentSheet: ps,
                                   onCompletion: handlePaymentSheetResult)
                    
                } else {
                    Text("No PaymentSheet Init")
                }
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
    
    func handlePaymentSheetResult(_ result: PaymentSheetResult) {
        Logger.debug("PaymentSheetResult: \(result)")
        switch result {
        case .completed:
            Logger.debug("PaymentSheetResult: \(result) - Submitting Order")
            self.submitOrder()
        case .canceled:
            Logger.debug("PaymentSheetResult: \(result) - On Cancel, Do _")
        case .failed(let sheetError):
            Logger.error("PaymentSheetResult: .failed - Error \(sheetError.localizedDescription) - On Error, Do _")
        }
    }
    
    func submitOrder() {
        if let orderId = store.state.cartViewState.cartId {
            store.send(.submitOrder(orderId))
        }
        
    }
}

struct DemoAppPaymentView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    
    static var previews: some View {
        NavigationStack {
            DemoAppPaymentView(store: AppStore.mockAppStoreBinding,
                               router: Router(),
                               cartViewState: mockCartViewState)
        }
    }
}
