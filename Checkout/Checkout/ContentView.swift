//
//  ContentView.swift
//  Checkout
//
//  Created by Alan Morford on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedOffer = VioletOffer()
    @StateObject var offerSelections = OfferSelections()

    #if os(iOS)
        @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    /*
     var body: some View {
         VStack {
             SelectedOfferView()
                 .padding()
         }
         .padding()
     }
     */

    var body: some View {
        #if os(iOS)
            if horizontalSizeClass == .compact {
                CheckoutNavigationView().environmentObject(offerSelections)
            }
            else {
                // For iPadOS
                // CheckoutSidebarNavigationView()
            }
        #else

        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
