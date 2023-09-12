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
    @StateObject var apiCallActivityState: APICallActivityState
    
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
                                         cartViewState: store.cartViewState,
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
                                                 shippingViewState: store.cartViewState.shippingViewState,
                                                 router: router)
                    case .selectShippingMethod:
                        DemoAppShippingMethodSelectView(store: $store,
                                                        router: router,
                                                        cartViewState: store.cartViewState)
                    case .payForOrder:
                        DemoAppPaymentView(store: $store,
                                           router: router,
                                           cartViewState: store.cartViewState)
                    case .orderConfirmation:
                        DemoAppOrderConfirmationView()
                    }
                    
                }.onAppear {
                    store.onAppAppear()
                }
        }
        .disabled(apiCallActivityState.isPendingAPICall)
        .overlay {
            if apiCallActivityState.isPendingAPICall {
                VStack {
                    ProgressView() {
                        Text("Loading")
                    }.frame(width: 110, height: 70, alignment: .center)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98).opacity(0.88)).cornerRadius(10)
                }
                .frame(minWidth: 390, minHeight: 844)
            }
        }
    }
}




struct DemoAppView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppView(store: AppStore.mockAppStoreBinding, router: Router(), apiCallActivityState: APICallActivityState())
    }
}
