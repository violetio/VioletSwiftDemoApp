//
//  OrderShippingMethodWrapperArrayView.swift
//  Checkout
//
//  Created by Alan Morford on 5/2/23.
//

import SwiftUI
import Violet

struct OrderShippingMethodWrapperArrayView: View {
    @Binding var orderShippingMethodWrapperArray: OrderShippingMethodWrapperArray?
    var body: some View {
        if let array = orderShippingMethodWrapperArray {
            Text("Shipping Options: \(array.count)")
//            if let firstShippingMethod = array.first?.shippingMethods?.first {
//                Text("Shipping: \(firstShippingMethod.shippingMethodId) - \(firstShippingMethod.price)")
//            }
        } else {
            Text("nil")
        }
    }
}

struct OrderShippingMethodWrapperArrayView_Previews: PreviewProvider {
    static var previews: some View {
        OrderShippingMethodWrapperArrayView(orderShippingMethodWrapperArray: .constant(PreviewMocks.orderShippingMethodWrapperArray()))
    }
}
