//
//  OfferSkusView.swift
//  Checkout
//
//  Created by Alan Morford on 5/1/23.
//

import SwiftUI
import VioletPublicClientAPI

struct OfferSkusView: View {
    
    @Binding var offerSkus: [Sku]
    var body: some View {
        List {
            if let offerSkus = offerSkus {
                Text("Got \(offerSkus.count) Skus")
                if let firstSku = offerSkus.first {
                    Text("First Sku \(firstSku.offerId)")
                }

            } else {
                Text("Got No Skus")
            }
        }
    }
}

struct OfferSkusView_Previews: PreviewProvider {
    static var previews: some View {
        OfferSkusView(offerSkus: .constant(PreviewMocks.MockOfferItem().skus()))
    }
}
