//
//  ShippingMethodOptionCard.swift
//  VioletTestStand
//
//  Created on 9/1/23.
//

import SwiftUI

struct ShippingMethodOptionCard: View {
    let shippingMethodArrayItem: ShippingMethodArrayItem
    @Binding var selectedShippingMethodID: String?
    var body: some View {

        ZStack {

            VStack(alignment: .leading, spacing: 0) {

                Text("\(shippingMethodArrayItem.label)")
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity, minHeight: 20, alignment: .topLeading)
                    .padding(.horizontal)
                    .padding(.vertical,0)
                //.withBlackBorder()
                Text("\(shippingMethodArrayItem.priceText)")
                    .foregroundColor(FigmaConstants.Colors.secondaryFontColor).opacity(0.6)
                    .font(.system(size: 13))
                    .frame(height: 20)
                    .padding(.horizontal)
                    .padding(.vertical,0)
                //.withBlackBorder()

            }.frame(width: 340, height: 69)
                .background(Color.white).cornerRadius(12)

            if shippingMethodArrayItem.shippingMethodId == selectedShippingMethodID {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue)
                    .frame(width: 338, height: 67)
            }
        }
    }
}

struct ShippingMethodOptionCard_Previews: PreviewProvider {

    static let mockShippingMethodArrayItem_Express = ShippingMethodArrayItem(bagID: 10101, price: 499, shippingMethodId: "express", label: "Express")

    static let mockShippingMethodArrayItem_Standard = ShippingMethodArrayItem(bagID: 10101, price: 0, shippingMethodId: "standard", label: "Standard")
    static var previews: some View {

        Group {
            ScrollView {
                ShippingMethodOptionCard(shippingMethodArrayItem: mockShippingMethodArrayItem_Express,
                                         selectedShippingMethodID: .constant(mockShippingMethodArrayItem_Express.shippingMethodId))
            }.frame(width: 390).withScrollViewBackgroundColor()
                .navigationTitle("Select")
                .previewDisplayName(mockShippingMethodArrayItem_Express.shippingMethodId)

            ScrollView {
                ShippingMethodOptionCard(shippingMethodArrayItem: mockShippingMethodArrayItem_Standard,
                                         selectedShippingMethodID: .constant(mockShippingMethodArrayItem_Express.shippingMethodId))
            }.frame(width: 390).withScrollViewBackgroundColor()
                .navigationTitle("Select")
                .previewDisplayName(mockShippingMethodArrayItem_Standard.shippingMethodId)
        }
    }
}
