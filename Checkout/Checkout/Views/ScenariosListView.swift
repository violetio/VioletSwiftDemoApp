//
//  ScenariosListView.swift
//  Checkout
//
//

import SwiftUI
import VioletPublicClientAPI

struct ScenariosListView: View {
    // var scenarios: [Scenario]

    // @EnvironmentObject private var model: Model

    /*
     var listedScenarios: [Scenario] {
         scenarios
             .filter { $0.matches(model.searchString) }
             .sorted(by: { $0.title.localizedCompare($1.title) == .orderedAscending })
     }
     */

    var body: some View {
        List {
            /*
             NavigationLink
             {
                 let model = OfferModel()
                 LoginView(offerModel:model)
             }
             label: {
                 Label("Login and Authorization", systemImage: "key")
             }
             */

            NavigationLink {
                let fakeOffer = Offer(id: 1, productId: "01001", name: "Offer Name", source: .shopify, merchantId: 42, minPrice: 0199)
                let offer12555 = MockOffers.load_Offer_12555()
                OfferView(offer: offer12555 ?? fakeOffer)
            }
                    label: {
                Label("Display Offer", systemImage: "bag")
            }

            NavigationLink {}
                    label: {
                    Label("Checkout", systemImage: "cart")
                }
        }
        .toolbarBackground(.orange, for: .navigationBar, .tabBar)
        .toolbar {
            ToolbarItemGroup {
                toolbarItems
            }
            ToolbarTitleMenu {
                Button {}
                        label: {
                        // Label("Placeholder", systemImage: "star")
                    }
            }
        }
        .navigationTitle("Scenarios")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    var toolbarItems: some View {
        NavigationLink(value: "Login") {
            Label("Login", systemImage: "key")
        }
    }
}

struct ScenariosListView_Previews: PreviewProvider {
    static var previews: some View {
        ScenariosListView()
    }
}
