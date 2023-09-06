//
//  DemoAppPaymentView.swift
//  Checkout
//
//  Created on 9/5/23
//

import SwiftUI
import StripePaymentSheet

struct DemoAppPaymentView: View {
    
//    @State private var paymentMethodParams: STPPaymentMethodParams = STPPaymentMethodParams()
//    @State private var cardFormIsComplete: Bool = false
    
    var body: some View {
        VStack {
            Text("Payment")
//            STPCardFormView.Representable(paymentMethodParams: $paymentMethodParams,
//                                          isComplete: $cardFormIsComplete)
//                .padding()
//            Button(action: {
//                print("Process payment...")
//            }, label: {
//                Text("Buy")
//            }).disabled(!cardFormIsComplete)
//            .padding()
        }
    }
}

struct DemoAppPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppPaymentView()
    }
}
