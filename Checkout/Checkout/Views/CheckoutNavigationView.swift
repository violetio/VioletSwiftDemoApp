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
    }

    @State private var selection: Tab = .scenarios

    var body: some View {
        TabView(selection: $selection)
        {
            NavigationView
            {
                //ScenariosListView(scenarios: [])
                //let offerModel = OfferModel()
                //LoginView(offerModel:offerModel)
                ScenariosListView()
            }
            .tabItem {
                let menuText = Text("Scenarios", comment: "API Scenarios")
                Label
                {
                    menuText
                }
                icon: {
                    Image(systemName: "house")
                }.accessibility(label: menuText)
            }
            .tag(Tab.scenarios)

            NavigationView {
                let fakeOffer = Offer(productId: "01001", name: "Offer Name", source: .shopify, merchantId: 42, minPrice: 0199)
                OfferView(offer:fakeOffer)
            }
            .tabItem {
                Label {
                    Text("Offers", comment: "Offers")
                } icon: {
                    Image(systemName: "basket.fill")
                }
            }
            .tag(Tab.history)


            NavigationView {
                let fakeOffer = Offer(productId: "01001", name: "Offer Name", source: .shopify, merchantId: 42, minPrice: 0199)
                OfferView(offer:fakeOffer)
            }
            .tabItem {
                Label {
                    Text("Offers", comment: "Offers")
                } icon: {
                    Image(systemName: "basket.fill")
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
