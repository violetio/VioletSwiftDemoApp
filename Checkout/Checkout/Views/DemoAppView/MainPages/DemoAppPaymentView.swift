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
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        VStack {
            
            Text("Stripe PaymentSheet")

            if let ps: PaymentSheet = cartViewState.paymentSheetViewState?.paymentSheet {
                
                Button(action: {
                    psIsPresented = true
                    Logger.debug("psIsPresented: \(psIsPresented)")
                }, label: {
                    Text("Buy")
                })
                .padding()
                .paymentSheet(isPresented: $psIsPresented,
                              paymentSheet: ps,
                              onCompletion: handlePaymentSheetResult)
            } else {
                Text("No PaymentSheet Init")
            }
        }
    }
    
    func handlePaymentSheetResult(_ result: PaymentSheetResult) {
        Logger.debug("PaymentSheetResult: \(result)")
    }
}

struct DemoAppPaymentView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    
    static var previews: some View {
        DemoAppPaymentView(cartViewState: CartViewState(order: mockOrder))
    }
}
