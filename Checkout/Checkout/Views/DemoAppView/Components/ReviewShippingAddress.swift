//
//  ReviewShippingAddress.swift
//  Checkout
//
//  Created on 9/11/23
//

import SwiftUI

struct ReviewShippingAddress: View {
    @ObservedObject var shippingViewState: ShippingViewState
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Shipping Address")
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color(red: 0.07, green: 0.09, blue: 0.15))
            //.frame(height: 20, alignment: .topLeading)
            
            Text(shippingViewState.shippingOrderAddressViewState.name)
            .font(.system(size: 12, weight: .regular))
            
            Text(shippingViewState.shippingOrderAddressViewState.address1)
            .font(.system(size: 12, weight: .regular))
            
            HStack {
                Text("\(shippingViewState.shippingOrderAddressViewState.city),")
                    .font(.system(size: 12, weight: .regular))
                Text(shippingViewState.shippingOrderAddressViewState.state)
                    .font(.system(size: 12, weight: .regular))
                
                Text("\t\(shippingViewState.shippingOrderAddressViewState.postalCode)")
                    .font(.system(size: 12, weight: .regular))
            }
            

        }
    }
}

struct ReviewShippingAddress_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_74445()!
    static let mockCartViewState = CartViewState(order: mockOrder)

    static var previews: some View {
        List {
            ReviewShippingAddress(shippingViewState: mockCartViewState.shippingViewState)
        }
    }
}
