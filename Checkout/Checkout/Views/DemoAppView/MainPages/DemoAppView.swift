//
//  DemoAppView.swift
//  Checkout
//
//  Created on 6/28/23
//

import SwiftUI

struct DemoAppView: View {
    @Binding var store: AppStore
    @State var appViewNavPath = NavigationPath()
    @EnvironmentObject var router: Router
    
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
                        }, cartViewState: store.cartViewState)
                    }
                }.navigationDestination(for: DemoProductGridOfferItem.self) { offerItem in
                    DemoAppOfferPDP(store: $store,
                                    offerItem: .constant(offerItem), appViewNavPath: $appViewNavPath,
                                    offerPDPViewState: store.state.updateOfferPDPViewState(offerItem: offerItem))
                    
                }.onAppear {
                    store.onAppAppear()
                }
        }
    }
}




struct DemoAppView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppView(store: AppStore.mockAppStoreBinding).environmentObject(Router())
    }
}
