//
//  Store+Sender.swift
//  Checkout
//
//  Created on 5/10/23
//

import Violet

extension AppStore {
    class AppSender {
        let state: AppState
        let pendingAPICalls = PendingAPICalls()

        init(state: AppState) {
            self.state = state
        }

        func send(_ action: AppAction) {
            switch action {
            case .offersPageRequest(let merchantId):
                Logger.info("Store: Offers Page Request:")
                let newAPICall = APICall(apiCall: GetPageOffersByMerchantIDRequest(merchantId: merchantId))
                pendingAPICalls.enqueue(newAPICall)
                self.state.offerSearchViewState.loading = true
                newAPICall.send { dataResponse, _ in
                    if let pageOffer = dataResponse {
                        Logger.info("Got PageOffer")
                        self.state.offerSearchViewState.updateLoadedOfferItems(pageOffer)
                        self.state.offerSearchViewState.loading = false
                    }
                }
            case .createCartRequest:
                Logger.info("Store: Create Cart Request:")
                let cartInit = CartInitializationRequest(baseCurrency: "USD")
                let newAPICall = APICall(apiCall: CreateCartRequest(cartInitializationRequest: cartInit,
                                                                    baseCurrency: "USD"))
                pendingAPICalls.enqueue(newAPICall)
                
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.info("Created Cart ID: \(orderId)")
                        self.state.cartViewState.updateWithNewOrder(order: order)
                    }
                }
            case .updateCartCustomerRequest:
                Logger.info("Store: Create Cart Request:")
            }
        }
    }
}

