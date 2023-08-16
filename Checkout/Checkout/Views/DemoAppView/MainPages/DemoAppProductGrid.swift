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
    @ObservedObject var offerSearchViewState: OfferSearchViewState

    let layout = [
        GridItem(.fixed(340))
    ]
    
    var body: some View {
        ScrollView {
            
            if offerSearchViewState.loading {
                VStack {
                    ProgressView() {
                        Text("Loading")
                    }
                    .frame(width: 109, height: 50, alignment: .center)
                    .cornerRadius(10)
                    
                }.withScrollViewBackgroundColor()
            } else {
                if offerSearchViewState.loadedOfferItems.count > 0 {
                    LazyVGrid(columns: layout, spacing: 20) {
                                    ForEach(offerSearchViewState.loadedOfferItems, id: \.offer_id) { offerItem in
                                        NavigationLink(value: offerItem) {
                                            DemoAppOfferCard(store: $store,
                                                             offerItem: .constant(offerItem))
                                        }
                                    }
                                }.offset(CGSize(width: 0, height: 20)) //This pushes scroll content top y down 15 pts
                                    .frame(minWidth: 390) //This matches the scrollview width to parent view width (at least on iPhone 14
                                    .withScrollViewBackgroundColor()
                } else {
                    ProgressView() {
                        Text("Workout")
                    }
                    
                }
                
            }
            
                
            
        }
    }
}

struct DemoAppProductGrid_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DemoAppProductGrid(store: AppStore.mockAppStoreBinding,
                               offerSearchViewState: OfferSearchViewState.mockLoaded()).previewDisplayName("Offers Returned")
            
            DemoAppProductGrid(store: AppStore.mockAppStoreBinding, offerSearchViewState: OfferSearchViewState.mockEmpty()).previewDisplayName("No Offers Returned")
            
            DemoAppProductGrid(store: AppStore.mockAppStoreBinding, offerSearchViewState: OfferSearchViewState.mockLoading()).previewDisplayName("Loading Offers")
        }
    }
}
