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
        List {
            ForEach(orderShippingMethodSelectViewState.bagIDToBagShippingMethodStateMap.keys.sorted(by: >), id: \.self) { key in
              
                if let value = orderShippingMethodSelectViewState.bagIDToBagShippingMethodStateMap[key] {
                    Section {
                        ForEach(value.shippingMethodArray) { aShippingMethodArrayItem in
                            VStack(alignment: .leading, spacing: 5) {
                                Text("\(aShippingMethodArrayItem.label)")
                                    .font(.system(size: 15))
                                    .frame(minHeight: 20)
                                Text("\(aShippingMethodArrayItem.price)")
                                    .foregroundColor(FigmaConstants.Colors.secondaryFontColor).opacity(0.6)
                                    .font(.system(size: 13))
                                    .frame(minHeight: 18)
                            }.frame(minHeight: 69)
                        }
                        
                    } header: {
                        Label(value.merchantName, image: "merchant_name_pre_icon").padding(.vertical, 10)
                    }//.withBlackBorder()
                }
            }

        }
        
    }
}

struct DemoAppShippingMethodSelectView_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    static let mockOrderShippingMethodWrapperArray = MockOffers.load_OrderID_72500_ShippingMethods()!
    static let mockOrderShippingMethodSelectViewState = OrderShippingMethodSelectViewState(orderShippingMethods: mockOrderShippingMethodWrapperArray)
    
    static var previews: some View {
        
        DemoAppShippingMethodSelectView(store: AppStore.mockAppStoreBinding,
                                        cartViewState: CartViewState(skuCount: 0), orderShippingMethodSelectViewState: mockOrderShippingMethodSelectViewState)
    }
}
