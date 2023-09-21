//
//  PaymentSheetPresentView.swift
//  Checkout
//
//  Created on 9/13/23
//

import PassKit
import SwiftUI
import StripePaymentSheet

struct PaymentSheetPresentView: View {
    @Binding var store: AppStore
    @ObservedObject var cartViewState: CartViewState
    @State var psIsPresented: Bool = false
    
    var body: some View {
        if let ps: PaymentSheet = cartViewState.paymentSheetViewState.paymentSheet {
            
            NextButton(buttonText: "Pay", nextEnabled: .constant(true)) {
                psIsPresented = true
                Logger.debug("psIsPresented: \(psIsPresented)")
            }.paymentSheet(isPresented: $psIsPresented,
                           paymentSheet: ps,
                           onCompletion: handlePaymentSheetResult)
            .onAppear {
                cartViewState.paymentSheetViewState.paymentAuthorizationResultHandler = self.handlePaymentAuthorizationResult
            }.onDisappear {
                cartViewState.paymentSheetViewState.paymentAuthorizationResultHandler = nil
            }
            
        } else {
            Text("No PaymentSheet Init")
        }
    }
    
    func handlePaymentSheetResult(_ result: PaymentSheetResult) {
        switch result {
        case .completed:
            if cartViewState.paymentSheetViewState.applePayConfiguration == nil {
                self.submitOrder()
            }
        default:
            Logger.debug("handlePaymentSheetResult: \(result)")
        }
        psIsPresented = false
    }
    
    /**
        Set on `paymentSheetViewState.paymentAuthorizationResultHandler` to run `submitOrder`
     */
    func handlePaymentAuthorizationResult(_ result: PKPaymentAuthorizationResult) {
        switch result.status {
        case .success:
            self.submitOrder()
        default:
            Logger.debug("authorizationResultHandler \(result.status)")
        
        }
        
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
                                cartViewState: mockCartViewState,
                                psIsPresented: false)
    }
}
