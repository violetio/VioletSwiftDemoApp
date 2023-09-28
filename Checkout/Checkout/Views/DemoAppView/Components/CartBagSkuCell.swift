//
//  CartBagSkuCell.swift
//  Checkout
//
//  Created on 8/17/23
//

import SwiftUI

struct CartBagSkuCell: View {
    @Binding var store: AppStore
    @ObservedObject var orderSkuViewState: OrderSkuViewState
    @State var locked: Bool = false
    var body: some View {
        HStack {
            if let thumbURL = orderSkuViewState.thumbURL {
                AsyncImage(url: thumbURL) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFill()
                    } else if phase.error != nil {
                        FigmaConstants.Colors.scrollViewBackgroundColor
                    } else {
                        FigmaConstants.Colors.scrollViewBackgroundColor
                    }
                    
                }.frame(width: 72,
                        height: 72).clipped()
            }
            else {
                Text("No Image Available")
                    .font(Font.custom("SF Pro", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(orderSkuViewState.name).truncationMode(.tail).lineLimit(2)
                    .font(.system(size: 12, weight: .semibold))
                Text(orderSkuViewState.brand)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
                HStack {
                    Text(orderSkuViewState.skuPriceText)
                        .font(.system(size: 12, weight: .semibold))
                    Spacer()
                    
                    if locked {
                        Spacer()
                        Text("QTY: \(orderSkuViewState.quantity)")
                        .frame(width: 170, alignment: .topTrailing)
                            .font(.system(size: 12, weight: .regular))
                        
                    } else {
                        QuantityPicker(quantitySelected: orderSkuViewState.quantity,
                                       store: $store,
                                       orderSkuViewState: orderSkuViewState)//.withBlackBorder()
                    }
                }

                  
            }
        }.swipeActions {
            if !locked {
                Button("Remove") {
                    store.sender.send(.removeSkuFromCart(orderSkuViewState.orderID, orderSkuViewState.orderSkuID))
                }.tint(.red)
            }
        }.frame(minHeight: 92)
        
        
    }
}

struct CartBagSkuCell_Previews: PreviewProvider {
    static let mockOrder = MockOffers.load_OrderID_71169()!
    static let mockBag = mockOrder.bags!.first!
    static let mockSku1 = mockBag.skus![0]
    static let mockSku2 = mockBag.skus![0]
    
    static var previews: some View {
        Group {
            CartBagSkuCell(store: AppStore.mockAppStoreBinding,
                           orderSkuViewState: OrderSkuViewState(orderID: mockOrder.id!, orderSku: mockSku1)).previewDisplayName("Unlocked")
            
            CartBagSkuCell(store: AppStore.mockAppStoreBinding,
                           orderSkuViewState: OrderSkuViewState(orderID: mockOrder.id!, orderSku: mockSku1), locked: true).previewDisplayName("Locked")
        }
    }
}
