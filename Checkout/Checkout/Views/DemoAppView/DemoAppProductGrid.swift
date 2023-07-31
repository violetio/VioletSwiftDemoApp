//
//  DemoAppProductGrid.swift
//  Checkout
//
//  Created on 6/29/23
//

import SwiftUI

/**
 
 Use Offer.vendor to populate OfferCard Merchant Name
 */
struct DemoAppProductGrid: View {
    @Binding var store: AppStore
    var loadedOffers: [DemoProductGridOfferItem] = PreviewMocks.MockOfferItemsArray2()
    let layout = [
        GridItem(.fixed(340))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 15) {
                ForEach(loadedOffers, id: \.offer_id) { offerItem in
                    DemoAppOfferCard(store: $store,
                                     offerItem: .constant(offerItem))
                }
            }.offset(CGSize(width: 0, height: 15)) //This pushes scroll content top y down 15 pts
                .frame(minWidth: 390) //This matches the scrollview width to parent view width (at least on iPhone 14
                .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                
            
        }
    }
}

struct DemoAppProductGrid_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppProductGrid(store: AppStore.mockAppStoreBinding)
    }
}
