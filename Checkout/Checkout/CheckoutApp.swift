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
        StripeAPI.defaultPublishableKey = "pk_test_UHg8oLvg4rrDCbvtqfwTE8qd"
    }
    var body: some Scene {
        WindowGroup {
            DemoAppView(store: .constant(store),
                        router: store.router,
                        apiCallActivityState: store.state.apiCallActivityState)
        }
    }
}
