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
        }
    }
    
    @ViewBuilder
    var BagTotalView: some View {
        HStack {
            Text("Bag Total")
                
            Spacer()
            Text(bagViewState.bagSubtotalText)
        }.font(.system(size: 12, weight: .semibold))
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
