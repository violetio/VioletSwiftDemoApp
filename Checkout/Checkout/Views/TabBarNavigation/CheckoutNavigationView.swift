//
//  CheckoutNavigationView.swift
//  Checkout
//
//

import SwiftUI
import VioletPublicClientAPI

struct CheckoutNavigationView: View {

    @State private var selection: Tab = .shopping
    @Binding var viewDataCoordinator: ViewDataCoordinator
    
    var body: some View {
        TabView(selection: $selection)
        {
            NavigationStack
            {
                ShoppingTabView()
//                PageOffersView(viewDataCoordinator: $viewDataCoordinator)
            }
            .tabItem {
                let menuText = Text("Shopping", comment: "API Scenarios")
                Label
                {
                    menuText
                }
                icon: {
                    Image(systemName: "square.grid.3x2")
                }.accessibility(label: menuText)
            }
            .tag(Tab.shopping)

            NavigationStack {
                CartTabView()
//                CartContentsView(viewDataCoordinator: $viewDataCoordinator)
            }
            .tabItem {
                Label {
                    Text("Cart", comment: "Cart")
                } icon: {
                    Image(systemName: "cart")
                }
            }
            .tag(Tab.cart)
            
            NavigationStack {
                SettingsTabView()
//                let fakeOffer = Offer(productId: "01001", name: "Offer Name", source: .shopify, merchantId: 42, minPrice: 0199)
//                OfferView(offer:fakeOffer)
            }
            .tabItem {
                Label {
                    Text("Settings", comment: "Settings")
                } icon: {
                    Image(systemName: "gear")
                }
            }
            .tag(Tab.settings)

        }.onAppear() {
            $viewDataCoordinator.wrappedValue.logDescription()
        }
    }
}

struct CheckoutNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutNavigationView( viewDataCoordinator: .constant(ViewDataCoordinator.mock()))
    }
}
