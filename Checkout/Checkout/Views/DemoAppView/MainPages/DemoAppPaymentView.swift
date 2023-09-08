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
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        ScrollView {
            VStack {
                
                Text("Review and Pay")
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    
                    CartAmountDetailLine(detailLabelText: "Subtotal",
                                         amountLabelText: cartViewState.cartSubTotalText)
                    CartAmountDetailLine(detailLabelText: "Shipping",
                                         amountLabelText: cartViewState.cartShippingTotalText)
                    CartAmountDetailLine(detailLabelText: "Tax",
                                         amountLabelText: cartViewState.cartTaxText)
                    CartAmountDetailLine(detailLabelText: "Total",
                                         amountLabelText: cartViewState.cartFullTotalText, fontWeight: .semibold)
                    
                    
                        
                }.frame(width: 340)
                
                if let ps: PaymentSheet = cartViewState.paymentSheetViewState?.paymentSheet {
                    
                    NextButton(buttonText: "Buy", nextEnabled: .constant(true)) {
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
    
    static var previews: some View {
        DemoAppPaymentView(store: AppStore.mockAppStoreBinding,
                           cartViewState: CartViewState(order: mockOrder))
    }
}
