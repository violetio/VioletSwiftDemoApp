////
//  AppStore
//  Checkout
//
//  Created on 5/4/23
//

import SwiftUI
import Violet
import Stripe

class AppStore {
    class AppState {

        var demoProxyViewState: DemoProxyActiveViewState
        var cartViewState: CartViewState
        var offerSearchViewState: OfferSearchViewState
        var currentOfferPDPViewState: OfferPDPViewState? = nil
        var apiCallActivityState = APICallActivityState()
        let router: Router = Router()
        
        func updateOfferPDPViewState( offerItem: DemoProductGridOfferItem) -> OfferPDPViewState {
            if let existingOfferPDPViewState = currentOfferPDPViewState {
                return existingOfferPDPViewState
            }
            let newOfferPDPViewState: OfferPDPViewState = OfferPDPViewState(offer: offerItem.offerEntity)
            currentOfferPDPViewState = newOfferPDPViewState
            return newOfferPDPViewState
        }
        
        func clearOfferPDPViewState() {
            self.currentOfferPDPViewState = nil
        }
        
        init(demoProxyActiveViewState: DemoProxyActiveViewState,
             cartViewState: CartViewState,
             offerSearchViewState: OfferSearchViewState) {
            self.demoProxyViewState = demoProxyActiveViewState
            self.cartViewState = cartViewState
            self.offerSearchViewState = offerSearchViewState
        }

        convenience init() {
            self.init(demoProxyActiveViewState: DemoProxyActiveViewState(),
                      cartViewState: CartViewState(),
                      offerSearchViewState: OfferSearchViewState())
        }
        
        func resumeExistingOrder(order: Order) {
            cartViewState.updateWithNewOrder(order: order)
        }
        
        func updateWithNewOrder(order: Order) {
            cartViewState.updateWithNewOrder(order: order)
        }
        
        func markCheckoutPageComplete(_ navigationKey: NavigationKey) {
            if !cartViewState.checkoutPagesComplete.contains(navigationKey) {
                cartViewState.checkoutPagesComplete.insert(navigationKey)
//                Logger.debug("markCheckoutPageComplete: \(navigationKey)")
                if navigationKey == .addShippingAddress {
                    Logger.debug("markCheckoutPageComplete: \(navigationKey) -> Go to \(NavigationKey.selectShippingMethod)")
                    router.append(NavigationKey.selectShippingMethod)
                }
                if navigationKey == .selectShippingMethod {
                    Logger.debug("markCheckoutPageComplete: \(navigationKey) -> Go to \(NavigationKey.payForOrder)")
                    router.append(NavigationKey.payForOrder)
                }
                if navigationKey == .payForOrder {
                    Logger.debug("markCheckoutPageComplete: \(navigationKey) -> Go to \(NavigationKey.orderConfirmation)")
                    router.append(NavigationKey.orderConfirmation)
                }
                
            }
        }
        
        func restart() {
            router.restart()
            cartViewState.restart()
            
        }
        
        
    }

    enum AppAction {
        case offersPageRequest(MerchantID?=nil)
        case createCartRequest
        case cartByID(OrderID)
        case addSkuToCart(OrderID,OfferSkuID,OrderQuantity)
        case updateSkuInCart(OrderID,OrderSkuID,OrderQuantity)
        case removeSkuFromCart(OrderID,OrderSkuID)
        case updateCartCustomerRequest(OrderID, OrderCustomer)
        case fetchShippingMethods(OrderID)
        case applyShippingMethods(OrderID, BagShippingMethodArray)
        case requestIntentBasedCapture(OrderID)
        case addSkuToCartWithIntent(OrderID,OfferSkuID,OrderQuantity)
        case submitOrder(OrderID)
    }

    func send(_ action: AppAction) {
        sender.send(action)
    }

    let state: AppState
    let sender: AppSender
    var router: Router { state.router }
    var firstAppearance: Bool = true
    
    static let mockAppStore = AppStore(cartViewState: CartViewState())
    static var mockAppStoreBinding: Binding<AppStore> { .constant(mockAppStore) }
    static func deviceSupportsApplePay() -> Bool {
        return StripeAPI.deviceSupportsApplePay()//true; //
    }

    var demoProxyActiveViewState: DemoProxyActiveViewState { state.demoProxyViewState }

    var cartViewState: CartViewState { state.cartViewState }
    var offerSearchViewState: OfferSearchViewState { state.offerSearchViewState }

    let useDemoLogin: Bool = true

    init(demoProxyActiveViewState: DemoProxyActiveViewState,
         cartViewState: CartViewState,
         offerSearchViewState: OfferSearchViewState)
    {
        let newState = AppState(demoProxyActiveViewState: demoProxyActiveViewState,
                                cartViewState: cartViewState,
                                offerSearchViewState: offerSearchViewState)
        self.state = newState
        self.sender = AppSender(state: newState)
    }

    convenience init(cartViewState: CartViewState? = nil) {
        self.init(demoProxyActiveViewState: DemoProxyActiveViewState(),
                  cartViewState: cartViewState ?? CartViewState(),
                  offerSearchViewState: OfferSearchViewState.mockEmpty())
    }
    
    func onAppAppear() {
        if firstAppearance {
            if offerSearchViewState.emtpy {
                sender.send(.offersPageRequest(nil))
            }
            if cartViewState.noCart {
                            sender.send(.createCartRequest)
                
//                sender.send(.cartByID(75154))
                //            sender.send(.requestIntentBasedCapture(74923))
            }
            firstAppearance = false
        }
    }
    
    func restart() {
        state.restart()
        
        self.send(.createCartRequest)
//        sender.send(.cartByID(75170))
    }
}
