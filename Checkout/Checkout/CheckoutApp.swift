//
//  CheckoutApp.swift
//  Checkout
//
//  Created by Alan Morford on 3/8/23.
//

import SwiftUI

@main
struct CheckoutApp: App {
    let store: AppStore = AppStore()
    var body: some Scene {
        WindowGroup {
            ContentView(store: .constant(store))
        }
    }
}
