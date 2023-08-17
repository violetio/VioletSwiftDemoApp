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
        Text("OrderSkuId: \(orderSkuViewState.orderSkuID)")
    }
}

struct CarBagOrderSkuListCell_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    
    static var previews: some View {
        CartBagSkuCell(orderSkuViewState: OrderSkuViewState(orderSku: mockOrder.bags![0].skus![0]))
    }
}
