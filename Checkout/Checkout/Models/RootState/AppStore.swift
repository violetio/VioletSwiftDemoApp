////
//  AppStore
//  Checkout
//
//  Created on 5/4/23
//

import SwiftUI

class AppStore {
    struct AppState {
        let defaultStartingTab: Tab = Tab.startingTab

        let visibleTabs: Set<Tab> = Set([.shopping, .cart, .settings, .history])

        var channelLoginViewState: ChannelLoginViewState
        var demoChannelViewState: DemoChannelViewState
        var shoppingViewState: ShoppingViewState

        init(channelLoginViewState: ChannelLoginViewState,
             demoChannelViewState: DemoChannelViewState,
             shoppingViewState: ShoppingViewState) {
            self.channelLoginViewState = channelLoginViewState
            self.demoChannelViewState = demoChannelViewState
            self.shoppingViewState = shoppingViewState
        }

        init() {
            self.init(channelLoginViewState: DemoInject.DemoChannelLoginViewState(),
                      demoChannelViewState: DemoChannelViewState(),
                      shoppingViewState: ShoppingViewState())
        }
    }

    enum AppAction {
        case changeActiveAppID(AppIDAndSecret)
        case logout
        case refreshAuthTokenRequest(ChannelHeaders)
        case loginRequest(LoginInputsType)
        case offersPageRequest(ChannelHeaders, MerchantID)
        case createCartRequest
        case updateCartCustomerRequest
    }

    func send(_ action: AppAction) {
        sender.send(action)
    }

    let state: AppState
    let sender: AppSender
    
    static let mockAppStore = AppStore(shoppingViewState: ShoppingViewState(offerPath: [],
                                                                            loadedOfferItems: PreviewMocks.MockOfferItemsArray(),
                                                                            offerItemPath: []))
    static var mockAppStoreBinding: Binding<AppStore> { .constant(mockAppStore) }

    var channelLoginViewState: ChannelLoginViewState { state.channelLoginViewState }
    var demoChannelViewState: DemoChannelViewState { state.demoChannelViewState }

    var shoppingViewState: ShoppingViewState { state.shoppingViewState }

    func demoLoginInputs(_ selectedDemoChannel: DemoChannels) -> LoginInputsType {
        return AppCreds.loginInputs(for: selectedDemoChannel)
    }

    let useDemoLogin: Bool = true

    init(channelLoginViewState: ChannelLoginViewState,
         demoChannelViewState: DemoChannelViewState,
         shoppingViewState: ShoppingViewState)
    {
        let newState = AppState(channelLoginViewState: channelLoginViewState,
                                demoChannelViewState: demoChannelViewState,
                                shoppingViewState: shoppingViewState)
        self.state = newState
        self.sender = AppSender(state: newState)
    }

    convenience init(shoppingViewState: ShoppingViewState? = nil) {
        self.init(channelLoginViewState: DemoInject.DemoChannelLoginViewState(),
                  demoChannelViewState: DemoChannelViewState(),
                  shoppingViewState: shoppingViewState ?? ShoppingViewState())
    }
}
