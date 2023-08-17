//
//  CartBagSection.swift
//  Checkout
//
//  Created on 8/16/23
//

import SwiftUI

struct CartBagSection: View {
    @ObservedObject var bagViewState: BagViewState
    
    var body: some View {
        Section() {
            Label("Merchant Name", image: "merchant_name_pre_icon")
            ForEach(bagViewState.orderSkuViewStatesArray) { orderSkuViewState in
                Text("OrderSkuId: \(orderSkuViewState.orderSkuID)")
            }
            
            //Text("Item 2")
            BagTotalView
        }
    }
    
    @ViewBuilder
    var BagTotalView: some View {
        HStack {
            Text("Bag Total")
                
            Spacer()
            Text("$1.99")
        }.font(.system(size: 12, weight: .semibold))
    }
}

struct CartBagSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CartBagSection(bagViewState: BagViewState(bagID: 56808, skuCount: 5))
        }
    }
}
