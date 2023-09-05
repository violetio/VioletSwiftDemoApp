//
//  CheckoutApp.swift
//  Checkout
//
//  Created on 3/8/23.
//

import SwiftUI
import Stripe

@main
struct CheckoutApp: App {
    let store: AppStore = AppStore()
    
    init() {
        //TODO: Is this necessary?
        //StripeAPI.defaultPublishableKey = ""
    }
    var body: some Scene {
        WindowGroup {
            DemoAppView(store: .constant(store), router: store.router, apiCallActivityState: store.state.apiCallActivityState)
//                .disabled(store.state.apiCallActivityState.pendingAPICall).overlay {
//                    if store.state.apiCallActivityState.pendingAPICall {
//                        VStack {
//                            ProgressView() {
//                                Text("Loading")
//                            }.frame(width: 110, height: 70, alignment: .center)
//                                .background(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.88)).cornerRadius(10)
//                        }.disabled(store.state.apiCallActivityState.pendingAPICall).frame(minWidth: 390, minHeight: 844)
//                            //.withBlackBorder()
//                    }
//                }
        }
    }
}
