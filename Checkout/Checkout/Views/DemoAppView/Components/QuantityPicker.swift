//
//  QuantityPicker.swift
//  Checkout
//
//  Created on 8/18/23
//

import SwiftUI

struct QuantityPicker: View {
    
    @State var quantitySelected: Int = 1
    @Binding var store: AppStore
    @ObservedObject var orderSkuViewState: OrderSkuViewState
    let pickRange = (1...10)
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Picker(selection: $quantitySelected) {
                ForEach(Array(pickRange), id: \.self) { pickValue in
                    Text("QTY: \(pickValue)").font(.system(size: 12, weight: .semibold)).tag(pickValue).foregroundColor(.black)
                }.foregroundColor(.black)
                
            } label: {}.frame(width: 95, height: 26)
                .scaleEffect(0.75).onChange(of: quantitySelected) { newValue in
                    Logger().info("Quantity now: \(newValue)")
                    var diff = newValue - orderSkuViewState.quantity
                    store.sender.send(.addSkuToCart(orderSkuViewState.orderID,
                                                    orderSkuViewState.orderSkuID, diff))
                }
        }.onAppear {
            quantitySelected = orderSkuViewState.quantity
        }
    }
}

struct QuantityPicker_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    static let mockBag = mockOrder.bags!.first!
    static let mockSku1 = mockBag.skus![0]
    static let mockSku2 = mockBag.skus![0]
    
    static var previews: some View {
        QuantityPicker(store: AppStore.mockAppStoreBinding,
                       orderSkuViewState: OrderSkuViewState(orderID: mockOrder.id!, orderSku: mockSku1))
    }
}
