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

        func startAPICall<T, DataResponseType: Codable>(_ with: T) -> APICall<T, DataResponseType> where T: DataResponseAPICall<DataResponseType> {
            let newAPICall = APICall(apiCall: with)
            state.apiCallActivityState.increment()
            pendingAPICalls.enqueue(newAPICall)
            return newAPICall
        }
        
        func send(_ action: AppAction) {
            switch action {
            case .offersPageRequest(let merchantId):
//                Logger.info("Store: Offers Page Request:")

                let newAPICall = self.startAPICall(GetPageOffersByMerchantIDRequest(merchantId: merchantId))
                newAPICall.send { dataResponse, dataError in
                    if let pageOffer = dataResponse {
//                        Logger.info("Got PageOffer")
                        self.state.offerSearchViewState.updateLoadedOfferItems(pageOffer)
                    } else if let apiError = dataError {
                        Logger.error(apiError.localizedDescription)
                        self.state.demoProxyViewState.setError(apiError: apiError)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .createCartRequest:
//                Logger.info("Store: Create Cart Request:")
                let cartInit = CartInitializationRequest(baseCurrency: "USD")
                let newAPICall = self.startAPICall(CreateCartRequest(cartInitializationRequest: cartInit,
                                                                     baseCurrency: "USD"))

                newAPICall.send { dataResponse, dataError in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.info("Created Cart ID: \(orderId)")
                        self.state.updateWithNewOrder(order: order)
                    } else if let apiError = dataError {
                        Logger.error(apiError.localizedDescription)
                        self.state.demoProxyViewState.setError(apiError: apiError)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .cartByID(let orderID):
                Logger.info("Store GetCartByID")
                let newAPICall = self.startAPICall(GetCartByIDRequest(orderId: orderID))

                newAPICall.send { dataResponse, dataError in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.info("Resume Cart ID: \(orderId)")
                        self.state.resumeExistingOrder(order: order)
                    } else if let apiError = dataError {
                        Logger.error(apiError.localizedDescription)
                        self.state.demoProxyViewState.setError(apiError: apiError)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .addSkuToCart(let orderID, let offerSkuId, let quantity):
                Logger.debug("Store+Sender: addSkuToCart \(orderID)")
                let orderSku = OrderSku(quantity: quantity, skuId: offerSkuId)
                let newAPICall = self.startAPICall(AddSkuToCartRequest(orderId: orderID,
                                                                      orderSku: orderSku))
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ addSkuToCart Cart ID: \(orderId)")
                        self.state.updateWithNewOrder(order: order)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .updateSkuInCart(let orderID, let orderSkuId, let quantity):
                Logger.debug("Store+Sender: updateSkuInCart \(orderID) - orderSkuId: - \(orderSkuId)")
                let orderSku = OrderSku(quantity: quantity, skuId: orderSkuId)
                let newAPICall = self.startAPICall(UpdateSkuInCartRequest(orderId: orderID,
                                                                         orderSkuId: orderSkuId,
                                                                         orderSku: orderSku))
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ updateSkuInCart Cart ID: \(orderId)")
                        self.state.updateWithNewOrder(order: order)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .removeSkuFromCart(let orderID, let orderSkuID):
                Logger.debug("Store+Sender: removeSku: \(orderSkuID) FromCart: \(orderID)")
                let newAPICall = self.startAPICall(RemoveSkuFromCartRequest(orderId: orderID,
                                                                           orderSkuId: orderSkuID))
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ RemoveSkuFromCart Cart ID: \(orderId)")
                        self.state.updateWithNewOrder(order: order)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .updateCartCustomerRequest(let orderID, let orderCustomer):
                Logger.debug("Store: Apply Order Customer - OrderID: \(orderID)")
                let newAPICall = self.startAPICall(CheckoutCartCustomerPostRequest(cartId: orderID,
                                                                                  guestOrderCustomer: orderCustomer))
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ updateCartCustomerRequest Cart ID: \(orderId)")
                        self.state.updateWithNewOrder(order: order)
//                        self.state.markCheckoutPageComplete(.addShippingAddress)
                        self.send(.fetchShippingMethods(orderID))
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .fetchShippingMethods(let orderID):
                Logger.debug("fetchShippingMethods: \(orderID)")
                let newAPICall = self.startAPICall(CheckoutCartShippingAvailableGetRequest(orderId: orderID))
                newAPICall.send { dataResponse, _ in
                    if let orderShippingMethodsArrayWrapper = dataResponse {
                        self.state.cartViewState.updateWithNewShippingMethods(orderShippingMethods: orderShippingMethodsArrayWrapper)
                        self.state.markCheckoutPageComplete(.addShippingAddress)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .applyShippingMethods(let orderID, let bagShippingMethodArray):
                Logger.debug("applyShippingMethods: \(orderID) method Count: \(bagShippingMethodArray.count)")
                let newAPICall = self.startAPICall(ApplyShippingMethodsRequest(orderId: orderID, body: bagShippingMethodArray))
                newAPICall.send { dataResponse, _ in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ applyShippingMethods Cart ID: \(orderId)")
                        self.state.updateWithNewOrder(order: order)
                        self.state.markCheckoutPageComplete(.selectShippingMethod)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .requestIntentBasedCapture(let orderID):
                Logger.debug("requestIntentBasedCapture: \(orderID)")
                let newAPICall = self.startAPICall(RequestIntentBasedCapturePayment(cartId: orderID))
                newAPICall.send { dataResponse, errorResponse in
                    if let order = dataResponse,
                       let orderId = order.id{
                        Logger.debug("Store+Sender: ✅ IntentBasedCapture Cart ID: \(orderId) paymentIntentClientSecret: \(String(describing: order.paymentIntentClientSecret))")
                        self.state.updateWithNewOrder(order: order)
                    } else if let error = errorResponse {
                        Logger.error(error.localizedDescription)
                    }
                    self.state.apiCallActivityState.decrement()
                }
            case .submitOrder(let orderId):
                Logger.debug("submitOrder: \(orderId)")
            }
        }
    }
}

