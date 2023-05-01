//
//  ShoppingTabView.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI

struct ShoppingTabView: View {
    @Binding var shoppingNavigationModel: ShoppingNavigationModel
    @ObservedObject var dataStore: DataStore = DataStore.shared
    
    let tab: Tab = .shopping
    
    func refreshPageOffers() {
        if let channelHeaders = dataStore.channelHeaders {
            Logger.debug("ShoppingTabView -> sendGetPageOffers")
            dataStore.apiCallService.sendGetPageOffers(channelHeaders: channelHeaders, merchantId: 10003)
        }
    }
    var body: some View {
        NavigationStack(path: $shoppingNavigationModel.offerItemPath) {
//            Text("Loaded Offer Items Count: \(dataStore.loadedOfferItems.count)")
            OffersGrid(loadedOfferItems: $dataStore.loadedOfferItems)
        }
        .navigationBarTitle("Offer Grid")
        .toolbar {
            Button("Refresh") {
                refreshPageOffers()
            }
        }
        .navigationDestination(for: OfferItem.self) { offerItem in
            OfferDetail(offerItem: .constant(offerItem), offerItemSelections: $shoppingNavigationModel.offerItemSelections)
        }
        .onAppear() {
            refreshPageOffers()
        }
        
    }
}

struct ShoppingTabView_Previews: PreviewProvider {
    
    static var mockOfferItems: [OfferItem] {
        //return []
        return PreviewMocks.MockOfferItemsArray()
    }
    static var previews: some View {
        ShoppingTabView(shoppingNavigationModel: .constant(ShoppingNavigationModel(offerItemPath: [], loadedOfferItems: mockOfferItems)))
    }
}
