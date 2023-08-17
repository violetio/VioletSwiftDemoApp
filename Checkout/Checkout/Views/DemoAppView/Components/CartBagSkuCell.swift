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
            
            VStack {
                Text("OrderSkuId: \(orderSkuViewState.orderSkuID)")
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
