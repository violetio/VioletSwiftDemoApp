//
//  DemoAppView.swift
//  Checkout
//
//  Created on 6/28/23
//

import SwiftUI

struct DemoAppView: View {
    @Binding var store: AppStore
    
    var body: some View {
        NavigationStack {
            DemoAppProductGrid(store: $store, offerSearchViewState: store.offerSearchViewState)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Text("Demo App")
                                .font(.system(size: FigmaConstants.NavBar.titleFontSize,
                                              weight: FigmaConstants.NavBar.titleFontWeight))
                              .foregroundColor(.black)
                            Spacer()

                        }.padding(.all)
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavBarCartButton(action: {
                            print("Custom button tapped!")
                        }, cartViewState: store.cartViewState)
                    }
                }.navigationDestination(for: DemoProductGridOfferItem.self) { offerItem in
                    DemoAppOfferPDP(store: $store,
                                    offerItem: .constant(offerItem),
                                    offerPDPViewState: OfferPDPViewState(offer: offerItem.offerEntity))
                }.onAppear {
                    if store.offerSearchViewState.emtpy {
                        store.sender.send(.offersPageRequest(10003))
                    }
                    if store.cartViewState.noCart {
                        //store.sender.send(.createCartRequest)
                        store.sender.send(.cartByID(71169))
                    }
                }
        }
    }
}




struct DemoAppView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppView(store: AppStore.mockAppStoreBinding)
    }
}
