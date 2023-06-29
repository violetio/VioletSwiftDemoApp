//
//  DemoAppProductGrid.swift
//  Checkout
//
//  Created on 6/29/23
//

import SwiftUI

struct DemoAppProductGrid: View {
    @Binding var store: AppStore
    var loadedOffers: [DemoProductGridOfferItem] = PreviewMocks.MockOfferItemsArray2()
    let layout = [
        GridItem(.fixed(340))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 5) {
                ForEach(loadedOffers, id: \.offer_id) { offerItem in
                    Text("\(offerItem.name)")
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct DemoAppProductGrid_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppProductGrid(store: AppStore.mockAppStoreBinding)
    }
}
