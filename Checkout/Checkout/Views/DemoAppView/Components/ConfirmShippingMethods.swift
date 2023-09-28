//
//  ConfirmShippingMethods.swift
//  Checkout
//
//  Created on 9/18/23
//

import SwiftUI

struct ConfirmShippingMethods: View {
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Text("Shipping Methods")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color(red: 0.07, green: 0.09, blue: 0.15))
            //.frame(height: 20, alignment: .topLeading)
            
            .font(.system(size: 12, weight: .regular))
            ForEach(cartViewState.bagViewStatesArray) { bagViewState in
//                Label(bagViewState.bagMerchantName, image: "merchant_name_pre_icon")
//                    .font(.system(size: 12, weight: .semibold))
                HStack {
                    Image("merchant_name_pre_icon").frame(width: 12, height: 12)
                    Text(bagViewState.bagMerchantName)
                        .font(.system(size: 12, weight: .semibold))
                }
                Text(bagViewState.bagShippingMethodLabel)
                .font(.system(size: 12))
            }
            //.frame(height: 20, alignment: .leading)

        }
    }
}

struct ConfirmShippingMethods_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74688()!
    static let mockCartViewState = CartViewState(order: mockOrder)
    static var previews: some View {
        ConfirmShippingMethods(cartViewState: mockCartViewState)
    }
}
