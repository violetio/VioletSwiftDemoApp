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
                state.channelLoginViewState.channelHeaders = nil
                state.channelLoginViewState.appIDandSecret = newAppIDAndSecret
            case .logout:
                state.channelLoginViewState.channelHeaders = nil
            case .refreshAuthTokenRequest(let channelHeaders):
                Logger.info("Store: Send Refresh Auth Token Request")
                let newAPICall = APICall(apiCall: AuthTokenGet(channelHeaders: channelHeaders))
                pendingAPICalls.enqueue(newAPICall)
                newAPICall.send { dataResponse, _ in
                    if let refreshResponse = dataResponse,
                       let newAuthToken = refreshResponse.token
                    {
                        Logger.info("Got refreshResponse")
                        self.state.channelLoginViewState.channelHeaders = channelHeaders.replaceToken(token: newAuthToken)
                    }
                }

            case .loginRequest(let loginInputs):
                Logger.info("Store: Send Login Request: \(loginInputs.username)")
                let newAPICall = APICall(apiCall: LoginPostRequest(loginInputs: loginInputs))
                pendingAPICalls.enqueue(newAPICall)
                newAPICall.send { dataResponse, _ in
                    if let loginResponse = dataResponse {
                        Logger.info("Got LoginResponse")
                        self.state.channelLoginViewState.channelHeaders = ChannelHeaders.from(loginResponse: loginResponse, appIdAndSecret: loginInputs)
                    }
                }

            case .offersPageRequest(let channelHeaders, let merchantId):
                Logger.info("Store: Offers Page Request:")
                let newAPICall = APICall(apiCall: GetPageOffersByMerchantIDRequest(channelHeaders: channelHeaders, merchantId: merchantId))
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

