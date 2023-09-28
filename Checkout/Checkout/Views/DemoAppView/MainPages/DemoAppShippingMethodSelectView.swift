//
//  DemoAppShippingMethodSelectView.swift
//  Checkout
//
//  Created on 8/28/23
//

import SwiftUI

struct DemoAppShippingMethodSelectView: View {
    @Binding var store: AppStore
    @StateObject var router: Router
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        ScrollView {
            Text("Select Shipping Methods")
            .font(.system(size: 17, weight: .semibold))
            .frame(width: 340, alignment: .topLeading)
            .padding()

            if let orderShippingMethodSelectViewState = cartViewState.orderShippingMethodSelectViewState {
                ForEach(orderShippingMethodSelectViewState.bagIDToBagShippingMethodStateMap.keys.sorted(by: >), id: \.self) { key in
                    
                    if let bagShippingMethodViewState = orderShippingMethodSelectViewState.bagIDToBagShippingMethodStateMap[key] {
                        
                        BagShippingMethodSelectView(bagShippingMethodSelectViewState: bagShippingMethodViewState).padding(.vertical)
                    }
                    
                }
                
                
                
                NextButton(nextEnabled: .constant(true)) {
                    Logger.debug("Next Button Tapped in Shipping Method Select")
                    if let orderId = cartViewState.cartId {
                        let bagShippingMethodArray: BagShippingMethodArray = orderShippingMethodSelectViewState.bagShippingMethodArray()
                        store.send(.applyShippingMethods(orderId, bagShippingMethodArray))
                    }
                }.frame(width: 340, alignment: .bottom).padding()
            }
        }.withScrollViewBackgroundColor()
            .navigationTitle("Select")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavBarCartButton(store: $store,
                                     cartViewState: store.cartViewState,
                                     router: router,
                                     ignoreNav: true)
                }
            }
        
    }
}

struct DemoAppShippingMethodSelectView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_73936()!
    static let mockOrderShippingMethodWrapperArray = MockOffers.load_OrderID_73936_ShippingMethods()!
    static let mockOrderShippingMethodSelectViewState = OrderShippingMethodSelectViewState(orderShippingMethods: mockOrderShippingMethodWrapperArray, order: mockOrder)
    
    static let mockOrder_74445 = MockOffers.load_OrderID_74445()!
    static let mockOrderShippingMethodWrapperArray_74445 = MockOffers.load_OrderID_74445_ShippingMethods()!
    static let mockCartViewState_74445 = CartViewState(order: mockOrder_74445, orderShippingMethods: mockOrderShippingMethodWrapperArray_74445)
    static let mockAppStore_74445 = AppStore(cartViewState: mockCartViewState_74445)
    
    
    static var previews: some View {
        
        Group {
            NavigationStack {
                DemoAppShippingMethodSelectView(store: AppStore.mockAppStoreBinding,
                                                router: Router(),
                                                cartViewState: CartViewState(order: mockOrder, orderShippingMethods: mockOrderShippingMethodWrapperArray))
            }.previewDisplayName("Multi Bag")
            
            NavigationStack {
                DemoAppShippingMethodSelectView(store: .constant(mockAppStore_74445),
                                                router: Router(),
                                                cartViewState: mockCartViewState_74445)
            }.previewDisplayName("Shipping Methods On Order")
        }
    }
}
