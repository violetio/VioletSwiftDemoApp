//
//  CartBagSkuCell.swift
//  Checkout
//
//  Created on 8/17/23
//

import SwiftUI

struct CartBagSkuCell: View {
    @ObservedObject var orderSkuViewState: OrderSkuViewState
    var body: some View {
        HStack {
            if let thumbURL = orderSkuViewState.thumbURL {
                AsyncImage(url: thumbURL) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFill()
                    } else if phase.error != nil {
                        FigmaConstants.Colors.scrollViewBackgroundColor
                    } else {
                        FigmaConstants.Colors.scrollViewBackgroundColor
                    }
                    
                }.frame(width: 72,
                        height: 72).clipped()
            }
            else {
                Text("No Image Available")
                    .font(Font.custom("SF Pro", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Offer name")
                    .font(.system(size: 12, weight: .semibold))
                Text("Brand Name")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
                Text("$50.00 ")
                    .font(.system(size: 12, weight: .semibold))
                  
            }
        }.swipeActions {
            Button("Remove") {
                print("Do Remove")
            }
        }
        
    }
}

struct CarBagOrderSkuListCell_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    static let mockBag = mockOrder.bags!.first!
    static let mockSku1 = mockBag.skus![0]
    static let mockSku2 = mockBag.skus![0]
    
    static var previews: some View {
        CartBagSkuCell(orderSkuViewState: OrderSkuViewState(orderSku: mockSku1))
    }
}
