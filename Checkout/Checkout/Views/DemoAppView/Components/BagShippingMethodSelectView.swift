//
//  BagShippingMethodSelectView.swift
//  VioletTestStand
//
//  Created on 9/4/23.
//

import SwiftUI

struct BagShippingMethodSelectView: View {
    @ObservedObject var bagShippingMethodSelectViewState: BagShippingMethodSelectViewState
    var body: some View {
        VStack(alignment: .leading) {
            Label(bagShippingMethodSelectViewState.merchantName, image: "merchant_name_pre_icon")
            ForEach(bagShippingMethodSelectViewState.shippingMethodArray) { aShippingMethodArrayItem in

                ShippingMethodOptionCard(shippingMethodArrayItem: aShippingMethodArrayItem,
                                         selectedShippingMethodID: $bagShippingMethodSelectViewState.selectedShippingMethodID).onTapGesture {
                    Logger.info("Tapped Shipping Method ID: \(aShippingMethodArrayItem.shippingMethodId)")
                    bagShippingMethodSelectViewState.selectedShippingMethodID = aShippingMethodArrayItem.shippingMethodId

                }

            }//.withBlackBorder()
        }.frame(width: 390)
    }
}

struct BagShippingMethodSelectView_Previews: PreviewProvider {
    static var previews: some View {
        BagShippingMethodSelectView(bagShippingMethodSelectViewState: BagShippingMethodSelectViewState(shippingMethodWrapper: nil))
    }
}
