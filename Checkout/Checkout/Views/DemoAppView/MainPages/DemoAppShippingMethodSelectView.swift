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

                    VStack(alignment: .leading) {
                        Label(bagShippingMethodViewState.merchantName, image: "merchant_name_pre_icon")
                        ForEach(bagShippingMethodViewState.shippingMethodArray) { aShippingMethodArrayItem in

                            ShippingMethodOptionCard(shippingMethodArrayItem: aShippingMethodArrayItem,
                                                     selectedShippingMethodID: .constant("")).onTapGesture {
                                Logger.info("Tapped Shipping Method ID: \(aShippingMethodArrayItem.shippingMethodId)")
                                bagShippingMethodViewState.selectedShippingMethodID = aShippingMethodArrayItem.shippingMethodId
                                orderShippingMethodSelectViewState.bagIDToShippingMethodIDs[bagShippingMethodViewState.bagID] = aShippingMethodArrayItem.shippingMethodId
                                
                            }

                        }//.withBlackBorder()
                    }.frame(width: 390)
                }

            }

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
