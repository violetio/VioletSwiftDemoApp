//
//  OffersGrid.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI

struct OffersGridView: View {
    @Binding var loadedOfferItems: [OfferItem]
    
    let layout = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 5) {
                ForEach($loadedOfferItems, id: \.offer_id) { offerItem in
                    NavigationLink(value: offerItem.wrappedValue) {
                        OfferGridTile(offerItem: offerItem)
                    }
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct OffersGrid_Previews: PreviewProvider {
    static var previews: some View {
        OffersGridView(loadedOfferItems: .constant(PreviewMocks.MockOfferItemsArray()))
    }
}
