//
//  ContentView.swift
//  Checkout
//
//  Created by Alan Morford on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedOffer = VioletOffer()
    var body: some View {
        VStack {
            HelloView()
            LoginButtonView()
            SelectedOfferView()
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
