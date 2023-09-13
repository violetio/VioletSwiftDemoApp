//
//  PaymentSheetPresentView.swift
//  Checkout
//
//  Created on 9/13/23
//

import SwiftUI
import SwiftUI
import StripePaymentSheet

struct PaymentSheetPresentView: View {
    @Binding var store: AppStore
    //@StateObject var router: Router
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        if let ps: PaymentSheet = cartViewState.paymentSheetViewState.paymentSheet {
            
            NextButton(buttonText: "Pay", nextEnabled: .constant(true)) {
                cartViewState.paymentSheetViewState.psIsPresented = true
                //Logger.debug("psIsPresented: \(cartViewState.paymentSheetViewState.psIsPresented)")
            }.paymentSheet(isPresented: $cartViewState.paymentSheetViewState.psIsPresented,
                           paymentSheet: ps,
                           onCompletion: handlePaymentSheetResult)
            
        } else {
            Text("No PaymentSheet Init")
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
        cartViewState.paymentSheetViewState.psIsPresented = false
    }
    
    func submitOrder() {
        if let orderId = store.state.cartViewState.cartId {
            store.send(.submitOrder(orderId))
        }
        
    }
}

struct PaymentSheetPresentView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    
    static var previews: some View {
        PaymentSheetPresentView(store: AppStore.mockAppStoreBinding,
//                                router: Router(),
                                cartViewState: mockCartViewState)
    }
}
