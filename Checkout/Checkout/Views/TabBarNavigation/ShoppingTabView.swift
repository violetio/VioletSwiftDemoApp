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
    
    var body: some View {
        NavigationStack(path: $shoppingNavigationModel.offerItemPath) {
            OffersGrid(loadedOfferItems: $shoppingNavigationModel.loadedOfferItems)
        }
        .navigationBarTitle("Offer Grid")
        .navigationDestination(for: OfferItem.self) { offerItem in
            OfferDetail(offerItem: .constant(offerItem), offerItemSelections: $shoppingNavigationModel.offerItemSelections)
        }.onAppear() {
            if let channelHeaders = dataStore.channelHeaders {
                Logger.debug("ShoppingTabView -> sendGetPageOffers")
                dataStore.apiCallService.sendGetPageOffers(channelHeaders: channelHeaders)
            }
        }
        
    }
}

struct ShoppingTabView_Previews: PreviewProvider {
    static var previews: some View {
        //.constant()
        ShoppingTabView(shoppingNavigationModel: .constant(ShoppingNavigationModel(offerItemPath: [], loadedOfferItems: PreviewMocks.MockOfferItemsArray())))
    }
}
