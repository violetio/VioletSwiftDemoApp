//
//  CheckoutNavigationView.swift
//  Checkout
//
//

import SwiftUI
import VioletPublicClientAPI

struct CheckoutNavigationView: View {

    @SceneStorage("navigation") private var navigationData: Data?
    @StateObject private var navigationModel = NavigationModel(offerItemPath: [], loadedOfferItems: PreviewMocks.MockOfferItemsArray())
    @ObservedObject var dataStore: DataStore = DataStore.shared
    
    var body: some View {
        TabView(selection: $navigationModel.selectedTab)
        {
            NavigationStack
            {
                ShoppingTabView(shoppingNavigationModel: $navigationModel.shoppingNavigationModel)
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
                CartTabView(offerItemSelections: $navigationModel.shoppingNavigationModel.offerItemSelections)
//                CartContentsView(viewDataCoordinator: $viewDataCoordinator)
            }
            .tabItem {
                Label {
                    Text("Cart", comment: "Cart")
                } icon: {
                    Image(systemName: "cart")
                }
            }
            //.badge(navigationModel.shoppingNavigationModel.offerItemSelections.itemCount) //Doesnt update?
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
            DataStore.shared.changeAppId(activeAppIDAndSecret: DemoAppIdAndSecret.byDemoChannel(DemoChannels.defaultDemoChannel))
        }
        
    }
}

struct CheckoutNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutNavigationView()
    }
}
