//
//  ReviewBagSection.swift
//  Checkout
//
//  Created on 9/11/23
//

import SwiftUI

struct ReviewBagSection: View {
    @Binding var store: AppStore
    @ObservedObject var bagViewState: BagViewState
    
    var body: some View {
        Section() {
            Label(bagViewState.bagMerchantName, image: "merchant_name_pre_icon")
            ForEach(bagViewState.orderSkuViewStatesArray) { orderSkuViewState in
                CartBagSkuCell(store: $store,
                               orderSkuViewState: orderSkuViewState)
                
            }
            BagTotalView
        }.alignmentGuide(.listRowSeparatorLeading) { d in
            d[.leading]
        }
    }
    
    @ViewBuilder
    var BagTotalView: some View {
        VStack {
            CartAmountDetailLine(detailLabelText: "Shipping Method",
                                 amountLabelText: bagViewState.bagShippingText).frame(height: 25)
            CartAmountDetailLine(detailLabelText: "Tax",
                                 amountLabelText: bagViewState.bagTaxText).frame(height: 25)
            CartAmountDetailLine(detailLabelText: "Total",
                                 amountLabelText: bagViewState.bagSubtotalText,
                                 fontWeight: .semibold).frame(height: 25)
        }
    }
}

struct ReviewBagSection_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    static let mockBagViewState_0 = mockCartViewState.bagViewStatesArray[0]
    static let mockBagViewState_1 = mockCartViewState.bagViewStatesArray[1]
    static var previews: some View {
        
        Group {
            List {
                ReviewBagSection(store: AppStore.mockAppStoreBinding,
                                 bagViewState: mockBagViewState_0)
            }.previewDisplayName("2 Sku Bag #1")
            
            List {
                ReviewBagSection(store: AppStore.mockAppStoreBinding,
                                 bagViewState: mockBagViewState_1)
            }.previewDisplayName("1 Sku Bag #2")
        }
    }
}
