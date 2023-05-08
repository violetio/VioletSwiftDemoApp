////
//  AppStore
//  Checkout
//
//  Created on 5/4/23
//

import SwiftUI

class AppStore {

    
    struct AppState {
        let defaultStartingTab: Tab = .settings

        let visibleTabs: Set<Tab> = Set([.shopping, .cart, .settings, .history])
    }

    enum AppAction {
        case changeActiveAppID(AppIDAndSecret)
        case logout
        case refreshAuthTokenRequest(ChannelHeaders)
        case loginRequest(LoginInputsType)
        case offersPageRequest(ChannelHeaders,MerchantID)
        case createCartRequest
        case updateCartCustomerRequest
    }

    func send(_ action: AppAction) {
        
        switch action {
        case .changeActiveAppID(let newAppIDAndSecret):
            Logger.info("Store: Setting channelLoginViewState.appIDandSecret")
            channelLoginViewState.channelHeaders = nil
            channelLoginViewState.appIDandSecret = newAppIDAndSecret
        case .logout:
            channelLoginViewState.channelHeaders = nil
        case .refreshAuthTokenRequest(let channelHeaders):
            Logger.info("Store: Send Refresh Auth Token Request")
            let newAPICall = APICall(apiCall: AuthTokenGet(channelHeaders: channelHeaders))
            pendingAPICalls.enqueue(newAPICall)
            newAPICall.send { dataResponse, error in
                if let refreshResponse = dataResponse,
                   let newAuthToken = refreshResponse.token {
                    Logger.info("Got refreshResponse")
                    self.channelLoginViewState.channelHeaders = channelHeaders.replaceToken(token: newAuthToken)
                }
            }

        case .loginRequest(let loginInputs):
            Logger.info("Store: Send Login Request: \(loginInputs.username)")
            let newAPICall = APICall(apiCall: LoginPostRequest(loginInputs: loginInputs))
            pendingAPICalls.enqueue(newAPICall)
            newAPICall.send { dataResponse, error in
                if let loginResponse = dataResponse {
                    Logger.info("Got LoginResponse")
                    self.channelLoginViewState.channelHeaders = ChannelHeaders.from(loginResponse: loginResponse, appIdAndSecret: loginInputs)
                }
            }

        case .offersPageRequest(let channelHeaders, let merchantId):
            Logger.info("Store: Offers Page Request:")
            let newAPICall = APICall(apiCall: GetPageOffersByMerchantIDRequest(channelHeaders: channelHeaders, merchantId: merchantId))
            pendingAPICalls.enqueue(newAPICall)
            newAPICall.send { dataResponse, error in
                if let pageOffer = dataResponse {
                    Logger.info("Got PageOffer")
                    self.shoppingViewState.mergePageOffer(pageOffer)
                }
            }
        case .createCartRequest:
            Logger.info("Store: Create Cart Request:")
        case .updateCartCustomerRequest:
            Logger.info("Store: Create Cart Request:")

        }
    }

    let state: AppState = AppState()
    static let mockAppStore = AppStore()
    static var mockAppStoreBinding: Binding<AppStore> { .constant(mockAppStore)}
    var channelLoginViewState = ChannelLoginViewState(appIDandSecret: DemoAppIdAndSecret.byDemoChannel(.defaultDemoChannel))
    var demoChannelViewState = DemoChannelViewState()
    
    var shoppingViewState = ShoppingViewState()
    let pendingAPICalls = PendingAPICalls()

    func demoLoginInputs(_ selectedDemoChannel: DemoChannels) -> LoginInputsType {
        return AppCreds.loginInputs(for: selectedDemoChannel)
    }

    let useDemoLogin: Bool = true
}
