//
//  OrderShippingMethodWrapperView.swift
//  Checkout
//
//  Created on 5/2/23.
//

import SwiftUI
import Violet

struct OrderShippingMethodWrapperView: View {
    
    @Binding var orderShippingMethodWrapper: OrderShippingMethodWrapper?
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct OrderShippingMethodWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        OrderShippingMethodWrapperView(orderShippingMethodWrapper: .constant(nil))
    }
}
