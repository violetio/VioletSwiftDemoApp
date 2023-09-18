//
//  InstantPaymentSheetPresentView.swift
//  Checkout
//
//  Created on 9/13/23
//

import Combine
import Foundation
import SwiftUI
import StripePaymentSheet
import Violet
import PassKit

struct InstantPaymentSheetPresentView: View {
    @Binding var store: AppStore
    //@StateObject var router: Router
    @ObservedObject var cartViewState: CartViewState
    @State var psIsPresented: Bool = false
    @Binding var selectedSkuID: Int64?
    @State private var waitingForIntent = false
    @Binding var hasPaymentIntent: Bool
    
    func applePayButtonAction() {
        Logger.info("Apple Pay Button Tapped!")
        if let paymentIntent = cartViewState.paymentSheetViewState.payment_intent_client_secret {
            psIsPresented = true
        } else {
            if cartViewState.bagCount == 0 {
                if let skuID = self.selectedSkuID,
                   let cartId = cartViewState.cartId {
                    self.waitingForIntent = true
                    store.send(.addSkuToCartWithIntent(cartId, skuID, 1))
                }
            } else {
                self.waitingForIntent = true
                if let cartId = cartViewState.cartId {
                    self.waitingForIntent = true
                    store.send(.requestIntentBasedCapture(cartId))
                }
            }
        }
    }
    
    var body: some View {
        if AppStore.DemoFeatures.pdpApplePay.isSupported {
            VStack {
                if AppStore.deviceSupportsApplePay() && store.cartViewState.bagCount <= 1 {
                    if let paymentSheet = cartViewState.paymentSheetViewState.paymentSheet {
                        PaymentButton(action: applePayButtonAction)
                            .frame(width: 340, height: 44).padding(.top)
                            .paymentSheet(isPresented: $psIsPresented,
                                          paymentSheet: paymentSheet,
                                          onCompletion: handlePaymentSheetResult)
                        
                    } else {
                        PaymentButton(action: applePayButtonAction)
                            .frame(width: 340, height: 44).padding(.top)
                    }
                }
                Text("SkuID: \(String(describing: selectedSkuID))")
            }.onReceive(Just(hasPaymentIntent)) {
                Logger.debug("hasPaymentIntent: \($0)")
                DispatchQueue.main.async {
                    trigger()
                }
                
            }
        }
    }

    func shippingContactChange(contact: PKContact) async -> PKPaymentRequestShippingContactUpdate {
        Logger.debug("contact: \(contact)")
        return PKPaymentRequestShippingContactUpdate(errors: nil, paymentSummaryItems: [], shippingMethods: [])
    }
    
    func trigger() {
        if waitingForIntent && hasPaymentIntent {
            psIsPresented = true
            waitingForIntent = false
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
        psIsPresented = false
    }
    
    func submitOrder() {
        if let orderId = store.state.cartViewState.cartId {
            store.send(.submitOrder(orderId))
        }
        
    }
}

struct InstantPaymentSheetPresentView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    
    static var previews: some View {
        InstantPaymentSheetPresentView(store: AppStore.mockAppStoreBinding,
//                                router: Router(),
                                cartViewState: mockCartViewState,
                                       psIsPresented: false,
                                       selectedSkuID: .constant(nil),
                                       hasPaymentIntent: .constant(false))
    }
}
