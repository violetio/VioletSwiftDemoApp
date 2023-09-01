//
//  SelectedOfferView.swift
//  Checkout
//
//  Created on 3/9/23.
//

import SwiftUI

struct SelectedOfferView: View {
    var offer_id: Int = 0
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Selected Offer View").bold()
            Text("Selected Offer ID: \(offer_id)")
        }
        .padding()
        .border(.black)
        
    }
}

struct SelectedOfferView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedOfferView()
    }
}
