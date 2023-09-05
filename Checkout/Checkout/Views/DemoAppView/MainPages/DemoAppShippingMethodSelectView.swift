//
//  DemoAppShippingMethodSelectView.swift
//  Checkout
//
//  Created on 8/28/23
//

import SwiftUI

struct DemoAppShippingMethodSelectView: View {
    @Binding var store: AppStore
    @ObservedObject var cartViewState: CartViewState
    @ObservedObject var orderShippingMethodSelectViewState: OrderShippingMethodSelectViewState
    
    var body: some View {
        ScrollView {
            
            ForEach(orderShippingMethodSelectViewState.bagIDToBagShippingMethodStateMap.keys.sorted(by: >), id: \.self) { key in

                if let bagShippingMethodViewState = orderShippingMethodSelectViewState.bagIDToBagShippingMethodStateMap[key] {

                    BagShippingMethodSelectView(bagShippingMethodSelectViewState: bagShippingMethodViewState).padding(.vertical)
                }

            }
            
            
            NextButton(nextEnabled: .constant(true)) {
                Logger.debug("Next Button Tapped in Shipping Method Select")
                if let orderId = cartViewState.cartId {
                    let bagShippingMethodArray: BagShippingMethodArray = []
                    store.send(.applyShippingMethods(orderId, bagShippingMethodArray))
                }
            }.frame(width: 340, alignment: .bottom).padding()

        }.withScrollViewBackgroundColor()
            .navigationTitle("Select")
        
    }
}

struct DemoAppShippingMethodSelectView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_73936()!
    static let mockOrderShippingMethodWrapperArray = MockOffers.load_OrderID_73936_ShippingMethods()!
    static let mockOrderShippingMethodSelectViewState = OrderShippingMethodSelectViewState(orderShippingMethods: mockOrderShippingMethodWrapperArray, order: mockOrder)
    
    static var previews: some View {
        
        Group {
            NavigationStack {
                DemoAppShippingMethodSelectView(store: AppStore.mockAppStoreBinding,
                                                cartViewState: CartViewState(skuCount: 0),
                                                orderShippingMethodSelectViewState: mockOrderShippingMethodSelectViewState)
            }.previewDisplayName("Multi Bag")
        }
    }
}
