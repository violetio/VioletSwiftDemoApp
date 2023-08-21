//
//  QuantityPicker.swift
//  Checkout
//
//  Created on 8/18/23
//

import SwiftUI

struct QuantityPicker: View {
    
    @State var quantitySelected: Int
    @Binding var store: AppStore
    @ObservedObject var orderSkuViewState: OrderSkuViewState
    let pickRange = (1...10)
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Picker(selection: $quantitySelected) {
                    ForEach(Array(pickRange), id: \.self) { pickValue in
                        Text("\(pickValue)").font(.system(size: 12, weight: .semibold)).tag(pickValue)
                    }
                    
                } label: {}
                    .frame(maxHeight: 21)
                    .scaleEffect(0.75)
                    .accentColor(.black)
//                    .border(Color.green)
            }
            HStack {
                Text("QTY:")
                    .frame(maxHeight: 21)
//                    .border(Color.green)
                    .font(.system(size: 12, weight: .regular))
                Spacer()
            }
        }.frame(maxWidth: 60, maxHeight: 21)
            //.border(Color.blue)
            .onChange(of: quantitySelected) { newValue in
                Logger().info("Quantity now: \(newValue)")
                store.sender.send(.updateSkuInCart(orderSkuViewState.orderID,
                                                   orderSkuViewState.orderSkuID, newValue))
            }
    }
}

struct QuantityPicker_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    static let mockBag = mockOrder.bags!.first!
    static let mockSku1 = mockBag.skus![0]
    static let mockSku2 = mockBag.skus![0]
    
    static var previews: some View {
        QuantityPicker(quantitySelected: 1, store: AppStore.mockAppStoreBinding,
                       orderSkuViewState: OrderSkuViewState(orderID: mockOrder.id!, orderSku: mockSku1))
    }
}
