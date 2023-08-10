////
//  AppStore
//  Checkout
//
//  Created on 5/4/23
//

import SwiftUI

class AppStore {
    struct AppState {

        var demoChannelViewState: DemoChannelViewState
        var shoppingViewState: ShoppingViewState
        var offerSearchViewState: OfferSearchViewState

        init(demoChannelViewState: DemoChannelViewState,
             shoppingViewState: ShoppingViewState,
             offerSearchViewState: OfferSearchViewState) {
            self.demoChannelViewState = demoChannelViewState
            self.shoppingViewState = shoppingViewState
            self.offerSearchViewState = offerSearchViewState
        }

        init() {
            self.init(demoChannelViewState: DemoChannelViewState(),
                      shoppingViewState: ShoppingViewState(),
                      offerSearchViewState: OfferSearchViewState())
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

    var demoChannelViewState: DemoChannelViewState { state.demoChannelViewState }

    var shoppingViewState: ShoppingViewState { state.shoppingViewState }
    var offerSearchViewState: OfferSearchViewState { state.offerSearchViewState }

    func demoLoginInputs(_ selectedDemoChannel: DemoChannels) -> LoginInputsType {
        return AppCreds.loginInputs(for: selectedDemoChannel)
    }

    let useDemoLogin: Bool = true

    init(demoChannelViewState: DemoChannelViewState,
         shoppingViewState: ShoppingViewState,
         offerSearchViewState: OfferSearchViewState)
    {
        let newState = AppState(demoChannelViewState: demoChannelViewState,
                                shoppingViewState: shoppingViewState,
                                offerSearchViewState: offerSearchViewState)
        self.state = newState
        self.sender = AppSender(state: newState)
    }

    convenience init(shoppingViewState: ShoppingViewState? = nil) {
        self.init(demoChannelViewState: DemoChannelViewState(),
                  shoppingViewState: shoppingViewState ?? ShoppingViewState(),
                  offerSearchViewState: OfferSearchViewState.mockLoaded())
    }
}
