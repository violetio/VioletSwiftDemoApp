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
    }

    @State private var selection: Tab = .scenarios

    var body: some View {
        TabView(selection: $selection)
        {
            NavigationStack
            {
                //ScenariosListView(scenarios: [])
                //let offerModel = OfferModel()
                //LoginView(offerModel:offerModel)
                PageOffersView(gridDataSource: PreviewMocks.MockOfferGridDataSource())
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
            .tag(Tab.history)

        }
    }
}

struct CheckoutNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutNavigationView()
    }
}
