//
//  CartBagSection.swift
//  Checkout
//
//  Created on 8/16/23
//

import SwiftUI

struct CartBagSection: View {
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
            CartAmountDetailLine(detailLabelText: "Bag Total",
                                 amountLabelText: bagViewState.bagSubtotalText,
                                 fontWeight: .semibold).frame(height: 25)
        }
    }
}

struct CartBagSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CartBagSection(store: AppStore.mockAppStoreBinding,
                           bagViewState: BagViewState(bagID: 56808, bag: MockOffers.load_OrderID_71169()!.bags![0]))
        }
    }
}
