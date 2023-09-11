//
//  ReviewEmailAddress.swift
//  Checkout
//
//  Created on 9/11/23
//

import SwiftUI

struct ReviewEmailAddress: View {
    @ObservedObject var shippingViewState: ShippingViewState
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Email Address")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color(red: 0.07, green: 0.09, blue: 0.15))
            //.frame(height: 20, alignment: .topLeading)
            
            Text(shippingViewState.email)
            .font(.system(size: 12, weight: .regular))
            //.frame(height: 20, alignment: .leading)

        }
    }
}

struct ReviewEmailAddress_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    static let mockCartViewState = CartViewState(order: mockOrder)

    static var previews: some View {
        List {
            ReviewEmailAddress(shippingViewState: mockCartViewState.shippingViewState)
        }
    }
}
