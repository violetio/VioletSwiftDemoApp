//
//  CheckoutApp.swift
//  Checkout
//
//  Created on 3/8/23.
//

import SwiftUI
import Stripe
import Violet

@main
struct CheckoutApp: App {
    let store: AppStore = AppStore()
    
    
    init() {
        StripeAPI.defaultPublishableKey = "pk_test_UHg8oLvg4rrDCbvtqfwTE8qd"
        //**Point VioletAPI to proxy host address by setting in `init.json` as "basePath"**
//        if let initBasePath = InitJson.initData["basePath"] as? String {
//            VioletAPI.basePath = initBasePath
//        }

    }
    var body: some Scene {
        WindowGroup {
            DemoAppView(store: .constant(store),
                        router: store.router,
                        apiCallActivityState: store.state.apiCallActivityState)
        }
    }
}
