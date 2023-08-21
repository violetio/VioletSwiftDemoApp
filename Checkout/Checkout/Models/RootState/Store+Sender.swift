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
                newAPICall.send { dataResponse, dataError in
                    if let pageOffer = dataResponse {
                        Logger.info("Got PageOffer")
                        self.state.offerSearchViewState.updateLoadedOfferItems(pageOffer)
                        self.state.offerSearchViewState.loading = false
                    } else if let apiError = dataError {
                        Logger.error(apiError.localizedDescription)
                        self.state.demoProxyViewState.setError(apiError: apiError)
                    }
                }
            case .createCartRequest:
                Logger.info("Store: Create Cart Request:")
                let cartInit = CartInitializationRequest(baseCurrency: "USD")
                let newAPICall = APICall(apiCall: CreateCartRequest(cartInitializationRequest: cartInit,
                                                                    baseCurrency: "USD"))
                pendingAPICalls.enqueue(newAPICall)

                newAPICall.send { dataResponse, dataError in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.info("Created Cart ID: \(orderId)")
                        self.state.cartViewState.updateWithNewOrder(order: order)
                    } else if let apiError = dataError {
                        Logger.error(apiError.localizedDescription)
                        self.state.demoProxyViewState.setError(apiError: apiError)
                    }
                }
            case .cartByID(let orderID):
                Logger.info("Store GetCartByID")
                let newAPICall = APICall(apiCall: GetCartByIDRequest(orderId: orderID))
                pendingAPICalls.enqueue(newAPICall)
                newAPICall.send { dataResponse, dataError in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.info("Resume Cart ID: \(orderId)")
                        self.state.cartViewState.updateWithNewOrder(order: order)
                    } else if let apiError = dataError {
                        Logger.error(apiError.localizedDescription)
                        self.state.demoProxyViewState.setError(apiError: apiError)
                    }
                }
            case .addSkuToCart(let orderID, let offerSkuId, let quantity):
                Logger.debug("Store+Sender: addSkuToCart \(orderID)")
                let orderSku = OrderSku(quantity: quantity, skuId: offerSkuId)
                let newAPICall = APICall(apiCall: AddSkuToCartRequest(orderId: orderID,
                                                                      orderSku: orderSku))
                pendingAPICalls.enqueue(newAPICall)
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ addSkuToCart Cart ID: \(orderId)")
                        self.state.cartViewState.updateWithNewOrder(order: order)
                    }
                }
            case .updateSkuInCart(let orderID, let orderSkuId, let quantity):
                Logger.debug("Store+Sender: updateSkuInCart \(orderID) - orderSkuId: - \(orderSkuId)")
                let orderSku = OrderSku(quantity: quantity, skuId: orderSkuId)
                let newAPICall = APICall(apiCall: UpdateSkuInCartRequest(orderId: orderID,
                                                                         orderSkuId: orderSkuId,
                                                                         orderSku: orderSku))
                pendingAPICalls.enqueue(newAPICall)
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ updateSkuInCart Cart ID: \(orderId)")
                        self.state.cartViewState.updateWithNewOrder(order: order)
                    }
                }
            case .removeSkuFromCart(let orderID, let orderSkuID):
                Logger.debug("Store+Sender: removeSku: \(orderSkuID) FromCart: \(orderID)")
                let newAPICall = APICall(apiCall: RemoveSkuFromCartRequest(orderId: orderID,
                                                                           orderSkuId: orderSkuID))
                pendingAPICalls.enqueue(newAPICall)
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ RemoveSkuFromCart Cart ID: \(orderId)")
                        self.state.cartViewState.updateWithNewOrder(order: order)
                    }
                }
            case .updateCartCustomerRequest:
                Logger.info("Store: Create Cart Request:")
            }
        }
    }
}

