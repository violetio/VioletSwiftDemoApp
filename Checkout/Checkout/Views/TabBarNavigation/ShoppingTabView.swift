//
//  ShoppingTabView.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI

struct ShoppingTabView: View {
    @Binding var store: AppStore
    @ObservedObject var shoppingViewState: ShoppingViewState
//    @Binding var shoppingNavigationModel: ShoppingNavigationModel
    
    let tab: Tab = .shopping
    
    func refreshPageOffers() {
        if let channelHeaders = store.channelLoginViewState.channelHeaders {
            Logger.debug("ShoppingTabView -> sendGetPageOffers")
            store.send(.offersPageRequest(channelHeaders, store.channelLoginViewState.merchantID))
        }
    }
    
    var body: some View {
        NavigationStack(path: $shoppingViewState.offerItemPath) {
            OffersGridView(store: $store)
        }
        .navigationBarTitle("Offer Grid")
        .toolbar {
            Button("Refresh") {
                refreshPageOffers()
            }
        }
        .navigationDestination(for: OfferItem.self) { offerItem in
            //OfferDetailView(offerItem: .constant(offerItem), offerItemSelections: $shoppingNavigationModel.offerItemSelections)
        }
        .onAppear {
            refreshPageOffers()
        }
    }
}

struct ShoppingTabView_Previews: PreviewProvider {
    static var mockOfferItems: [OfferItem] {
        // return []
        return PreviewMocks.MockOfferItemsArray()
    }

    static var previews: some View {
        ShoppingTabView(store: AppStore.mockAppStoreBinding,
                        shoppingViewState: AppStore.mockAppStore.shoppingViewState)
    }
}
