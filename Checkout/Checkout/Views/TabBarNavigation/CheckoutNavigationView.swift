//
//  CheckoutNavigationView.swift
//  Checkout
//
//

import SwiftUI
import VioletPublicClientAPI

struct CheckoutNavigationView: View {
    enum Tab {
        case scenarios
        case history
        case shopping
        case cart
        case settings
    }

    @State private var selection: Tab = .scenarios
    @State var gridDataSource: OfferGridDataSource

    init(gridDataSource: OfferGridDataSource = OfferGridDataSource()) {
        self.gridDataSource = gridDataSource
    }
    
    var body: some View {
        TabView(selection: $selection)
        {
            NavigationStack
            {
                PageOffersView(gridDataSource: $gridDataSource)
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
                CartContentsView()
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
                let fakeOffer = Offer(productId: "01001", name: "Offer Name", source: .shopify, merchantId: 42, minPrice: 0199)
                OfferView(offer:fakeOffer)
            }
            .tabItem {
                Label {
                    Text("Settings", comment: "Settings")
                } icon: {
                    Image(systemName: "gear")
                }
            }
            .tag(Tab.settings)

        }
    }
}

struct CheckoutNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutNavigationView(gridDataSource: PreviewMocks.MockOfferGridDataSource())
            .environmentObject(PreviewMocks.Mock_OfferSelectionsState())
    }
}
