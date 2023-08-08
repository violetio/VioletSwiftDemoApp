//
//  CheckoutNavigationView.swift
//  Checkout
//
//

import SwiftUI
import Violet

struct CheckoutNavigationView: View {

    @Binding var store: AppStore
    @SceneStorage("navigation") private var navigationData: Data?
    @StateObject private var navigationModel = NavigationModel(offerItemPath: [], loadedOfferItems: PreviewMocks.MockOfferItemsArray())

    @State private var selection: Tab = Tab.startingTab
    
    var body: some View {
        TabView(selection: $selection)
        {
            NavigationStack
            {
                DemoAppView(store: $store)
            }
            .tabItem {
                let menuText = Text("DemoAppView", comment: "No comment")
                Label
                {
                    menuText
                }
                icon: {
                    Image(systemName: "cart")
                }.accessibility(label: menuText)
            }
            .tag(Tab.demo)
            
            NavigationStack
            {
                ShoppingTabView(store: $store, shoppingViewState: store.shoppingViewState)
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
                CartTabView(store: $store, offerItemSelections: $navigationModel.shoppingNavigationModel.offerItemSelections)
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
                SettingsTabView(store: $store,
                                channelLoginViewState: store.channelLoginViewState)
            }
            .tabItem {
                Label {
                    Text("Settings", comment: "Settings")
                } icon: {
                    Image(systemName: "gear")
                }
            }
            .tag(Tab.settings)

        }.toolbar(.hidden, for: .tabBar)
            .onAppear() {
            selection = store.state.defaultStartingTab
            
        }
        
    }
}

struct CheckoutNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutNavigationView(store: AppStore.mockAppStoreBinding)
    }
}
