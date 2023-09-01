//
//  DemoAppView.swift
//  Checkout
//
//  Created on 6/28/23
//

import SwiftUI

struct DemoAppView: View {
    @Binding var store: AppStore
    @StateObject var router: Router
    
    var body: some View {
        NavigationStack(path: $router.paths) {
            DemoAppProductGrid(store: $store, offerSearchViewState: store.offerSearchViewState, demoProxyViewState: store.demoChannelViewState)
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
                        NavBarCartButton(store: $store,
                                         action: {
                            print("Custom button tapped!")
                        }, cartViewState: store.cartViewState,
                                         router: router)
                    }
                }.navigationDestination(for: NavigationKey.self) { key in
                    switch key {
                    case .offerPDP(let offerItem):
                        DemoAppOfferPDP(store: $store,
                                        offerItem: .constant(offerItem),
                                        offerPDPViewState: store.state.updateOfferPDPViewState(offerItem: offerItem),
                                        router: router)
                    case .cartView:
                        DemoAppCartView(store: $store,
                                        cartViewState: store.state.cartViewState,
                                        router: router)
                    case .addShippingAddress:
                        DemoAppGuestCheckoutView(store: $store,
                                                 shippingViewState: store.state.shippingViewState,
                                                 router: router)
                    case .selectShippingMethod:
                        DemoAppShippingMethodSelectView(store: $store,
                                                        cartViewState: store.cartViewState,
                                                        orderShippingMethodSelectViewState: store.cartViewState.orderShippingMethodSelectViewState)
                    }
                    
                }.onAppear {
                    store.onAppAppear()
                }
        }
    }
}




struct DemoAppView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppView(store: AppStore.mockAppStoreBinding, router: Router())
    }
}
