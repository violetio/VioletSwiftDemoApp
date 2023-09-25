//
//  PaymentSheetPresentView.swift
//  Checkout
//
//  Created on 9/13/23
//

import Combine
import PassKit
import SwiftUI
import StripePaymentSheet

struct PaymentSheetPresentView: View {
    @Binding var store: AppStore
    @ObservedObject var cartViewState: CartViewState
    @State var psIsPresented: Bool = false
    @State var paymentSheetEvents: [PaymentSheetEvents] = []
    
    var body: some View {
        if let ps: PaymentSheet = cartViewState.paymentSheetViewState.paymentSheet {
            
            NextButton(buttonText: "Pay", nextEnabled: .constant(true)) {
                paymentSheetEvents.append(.presented)
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
        Logger.debug("handlePaymentSheetResult")
        switch result {
        case .completed:
            Logger.debug("handlePaymentSheetResult: \(result)")
            if !paymentSheetEvents.contains(.orderSubmitted) {
                Logger.debug("submitOrder")
                paymentSheetEvents.append(.orderSubmitted)
                self.submitOrder()
            } else {
                Logger.debug("applePayConfiguration non-nil!")
            }
        default:
            Logger.debug("handlePaymentSheetResult: \(result)")
        }
        psIsPresented = false
        paymentSheetEvents = []
    }
    
    /**
        Set on `paymentSheetViewState.paymentAuthorizationResultHandler` to run `submitOrder`
     */
    func handlePaymentAuthorizationResult(_ result: PKPaymentAuthorizationResult) {
        switch result.status {
        case .success:
            
                paymentSheetEvents.append(.orderSubmitted)
                self.submitOrder()
            
        default:
            Logger.debug("authorizationResultHandler \(result.status)")
        
        }
        
    }
    
    func submitOrder() {
        if let orderId = store.state.cartViewState.cartId {
            Logger.debug("submit orderId: \(orderId)")
            store.send(.submitOrder(orderId))
        } else {
            Logger.debug("submit NO orderId")
        }
        
    }
    
    enum PaymentSheetEvents {
        case presented
        case orderSubmitted
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
