//
//  Store+Sender.swift
//  Checkout
//
//  Created on 5/10/23
//

extension AppStore {
    class AppSender {
        let state: AppState
        let pendingAPICalls = PendingAPICalls()

        init(state: AppState) {
            self.state = state
        }

        func send(_ action: AppAction) {
            switch action {
            case .changeActiveAppID(let newAppIDAndSecret):
                Logger.info("Store: Setting channelLoginViewState.appIDandSecret")
//                state.channelLoginViewState.channelHeaders = nil
//                state.channelLoginViewState.appIDandSecret = newAppIDAndSecret
            case .logout:
                Logger.info("Logout")
//                state.channelLoginViewState.channelHeaders = nil
            case .refreshAuthTokenRequest(let channelHeaders):
                Logger.info("Store: Unsupported - Refresh Auth Token Request")

            case .loginRequest(let loginInputs):
                Logger.info("Store: Send Login Request: \(loginInputs.username)")

            case .offersPageRequest(let channelHeaders, let merchantId):
                Logger.info("Store: Offers Page Request:")
                let newAPICall = APICall(apiCall: GetPageOffersByMerchantIDRequest(merchantId: merchantId))
                pendingAPICalls.enqueue(newAPICall)
                newAPICall.send { dataResponse, _ in
                    if let pageOffer = dataResponse {
                        Logger.info("Got PageOffer")
                        self.state.shoppingViewState.mergePageOffer(pageOffer)
                    }
                }
            case .createCartRequest:
                Logger.info("Store: Create Cart Request:")
            case .updateCartCustomerRequest:
                Logger.info("Store: Create Cart Request:")
            }
        }
    }
}

