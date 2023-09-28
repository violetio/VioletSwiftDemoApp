//
//  DemoAppOfferCardText.swift
//  Checkout
//
//  Created on 8/8/23
//

import SwiftUI

struct DemoAppOfferCardText: View {
    @Binding var offerItem: DemoProductGridOfferItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(offerItem.name)")
                .font(.system(size: 21, weight: .semibold))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .topLeading)
            Text("\(offerItem.vendor)")
                .font(.system(size: 14, weight: .regular))
                .italic()
                .foregroundColor(FigmaConstants.Colors.systemGrey1)
                .frame(minHeight: 25)
            Label("\(offerItem.seller)", image: "merchant_name_pre_icon")
                    .font(Font.custom("Inter", size: 14))
                    .labelStyle(.titleAndIcon)
                    .foregroundColor(FigmaConstants.Colors.systemGrey1)
            Text("\(offerItem.intPrice.priceText())")
                .font(.system(size: 14, weight: .bold))
              .foregroundColor(.black)
            
        }
    }
}

struct DemoAppOfferCardText_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppOfferCardText(offerItem: .constant(PreviewMocks.Mock_DemoProductGridOfferItem_12574()))
    }
}
