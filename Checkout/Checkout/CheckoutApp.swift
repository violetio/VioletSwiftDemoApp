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
    @StateObject var router = Router()
    
    init() {
        //TODO: Is this necessary?
        //StripeAPI.defaultPublishableKey = ""
    }
    var body: some Scene {
        WindowGroup {
            DemoAppView(store: .constant(store), router: store.router)
        }
    }
}
