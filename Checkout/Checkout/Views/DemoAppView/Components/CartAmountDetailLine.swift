//
//  CartAmountDetailLine.swift
//  Checkout
//
//  Created on 9/8/23
//

import SwiftUI

struct CartAmountDetailLine: View {
    
    var detailLabelText: String
    var amountLabelText: String
    var body: some View {
        HStack {
            Text(detailLabelText)
            Spacer()
            Text(amountLabelText)
        }.font(.system(size: 14, weight: .semibold))
    }
}

struct CartAmountDetailLine_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    static var previews: some View {
        VStack {
            CartAmountDetailLine(detailLabelText: "Total",
                                 amountLabelText: mockCartViewState.cartFullTotalText)
        }.frame(width: 340)
    }
}
