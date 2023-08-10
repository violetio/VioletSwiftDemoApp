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
        var cartViewState: CartViewState
        var offerSearchViewState: OfferSearchViewState

        init(demoChannelViewState: DemoChannelViewState,
             cartViewState: CartViewState,
             offerSearchViewState: OfferSearchViewState) {
            self.demoChannelViewState = demoChannelViewState
            self.cartViewState = cartViewState
            self.offerSearchViewState = offerSearchViewState
        }

        init() {
            self.init(demoChannelViewState: DemoChannelViewState(),
                      cartViewState: CartViewState(),
                      offerSearchViewState: OfferSearchViewState())
        }
    }

    enum AppAction {
        case changeActiveAppID(AppIDAndSecret)
        case logout
        case refreshAuthTokenRequest(ChannelHeaders)
        case loginRequest(LoginInputsType)
        case offersPageRequest(MerchantID)
        case createCartRequest
        case updateCartCustomerRequest
    }

    func send(_ action: AppAction) {
        sender.send(action)
    }

    let state: AppState
    let sender: AppSender
    
    static let mockAppStore = AppStore(cartViewState: CartViewState())
    static var mockAppStoreBinding: Binding<AppStore> { .constant(mockAppStore) }

    var demoChannelViewState: DemoChannelViewState { state.demoChannelViewState }

    var cartViewState: CartViewState { state.cartViewState }
    var offerSearchViewState: OfferSearchViewState { state.offerSearchViewState }

    func demoLoginInputs(_ selectedDemoChannel: DemoChannels) -> LoginInputsType {
        return AppCreds.loginInputs(for: selectedDemoChannel)
    }

    let useDemoLogin: Bool = true

    init(demoChannelViewState: DemoChannelViewState,
         cartViewState: CartViewState,
         offerSearchViewState: OfferSearchViewState)
    {
        let newState = AppState(demoChannelViewState: demoChannelViewState,
                                cartViewState: cartViewState,
                                offerSearchViewState: offerSearchViewState)
        self.state = newState
        self.sender = AppSender(state: newState)
    }

    convenience init(cartViewState: CartViewState? = nil) {
        self.init(demoChannelViewState: DemoChannelViewState(),
                  cartViewState: cartViewState ?? CartViewState(),
                  offerSearchViewState: OfferSearchViewState.mockLoaded())
    }
}
