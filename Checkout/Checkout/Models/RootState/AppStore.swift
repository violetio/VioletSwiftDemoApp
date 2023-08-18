////
//  AppStore
//  Checkout
//
//  Created on 5/4/23
//

import SwiftUI

class AppStore {
    class AppState {

        var demoProxyViewState: DemoProxyActiveViewState
        var cartViewState: CartViewState
        var offerSearchViewState: OfferSearchViewState
        var offerPDPViewStates: [Int64: OfferPDPViewState] = [:]
        
        func updateOfferPDPViewState( offerItem: DemoProductGridOfferItem) -> OfferPDPViewState {
            if let existingOfferPDPViewState = offerPDPViewStates[offerItem.id] {
                return existingOfferPDPViewState
            }
            let newOfferPDPViewState: OfferPDPViewState = OfferPDPViewState(offer: offerItem.offerEntity)
            offerPDPViewStates[offerItem.id] = newOfferPDPViewState
            return newOfferPDPViewState
        }
        
        init(demoChannelViewState: DemoProxyActiveViewState,
             cartViewState: CartViewState,
             offerSearchViewState: OfferSearchViewState) {
            self.demoProxyViewState = demoChannelViewState
            self.cartViewState = cartViewState
            self.offerSearchViewState = offerSearchViewState
        }

        convenience init() {
            self.init(demoChannelViewState: DemoProxyActiveViewState(),
                      cartViewState: CartViewState(),
                      offerSearchViewState: OfferSearchViewState())
        }
    }

    enum AppAction {
        case offersPageRequest(MerchantID)
        case createCartRequest
        case cartByID(OrderID)
        case addSkuToCart(OrderID,OrderSkuID,OrderQuantity)
        case removeSkuFromCart(OrderID,OrderSkuID)
        case updateCartCustomerRequest
    }

    func send(_ action: AppAction) {
        sender.send(action)
    }

    let state: AppState
    let sender: AppSender
    
    static let mockAppStore = AppStore(cartViewState: CartViewState())
    static var mockAppStoreBinding: Binding<AppStore> { .constant(mockAppStore) }

    var demoChannelViewState: DemoProxyActiveViewState { state.demoProxyViewState }

    var cartViewState: CartViewState { state.cartViewState }
    var offerSearchViewState: OfferSearchViewState { state.offerSearchViewState }

    let useDemoLogin: Bool = true

    init(demoChannelViewState: DemoProxyActiveViewState,
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
        self.init(demoChannelViewState: DemoProxyActiveViewState(),
                  cartViewState: cartViewState ?? CartViewState(),
                  offerSearchViewState: OfferSearchViewState.mockEmpty())
    }
}
