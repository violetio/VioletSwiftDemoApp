//
//  CartContentsView.swift
//  Checkout
//
//

import SwiftUI

struct CartContentsView: View {
    @EnvironmentObject var offerSelections: OfferSelections
    
    var body: some View {
//
        let offerIdsList = offerSelections.offerIdsList()
        ScrollView {
            ForEach(offerIdsList, id: \.self) { offer_id in
                Text(String(offer_id))
                CartItemView()
            }
        }.navigationTitle("Items In Cart: \(offerIdsList.count)")
    }
}

struct CartContentsView_Previews: PreviewProvider {
    static var previews: some View {
        CartContentsView().environmentObject(PreviewMocks.Mock_OfferSelectionsState())
    }
}
