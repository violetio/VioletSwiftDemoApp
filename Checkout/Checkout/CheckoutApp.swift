//
//  CheckoutApp.swift
//  Checkout
//
//  Created by Alan Morford on 3/8/23.
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
            ContentView(store: .constant(store))
        }
    }
}
