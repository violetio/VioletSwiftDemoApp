//
//  TabContentView.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI
import VioletPublicClientAPI

enum CartListSections: Int, CaseIterable, Identifiable {
    case OfferItems
    case Checkout
    
    var id: Int { rawValue }
}

struct CartTabView: View {
    
    @Binding var offerItemSelections: OfferItemSelections
    @ObservedObject var dataStore: DataStore = DataStore.shared
    
    var tab: Tab = .cart
    
    func doCreateCart() {
        if dataStore.currentOrder != nil {
            Logger.info("Already have a Cart with ID:")
        } else {
            let orderSkus = offerItemSelections.items.compactMap { $0.firstSku() }.map { OrderSku(skuId: $0.id) }
            if let channelHeaders = dataStore.channelHeaders {
                Logger.debug("CartTabView -> sendCreateCart")
                let orderSkus: [OrderSku] = []
                dataStore.apiCallService.sendCreateCart(channelHeaders: channelHeaders, orderSkus: orderSkus)
            }
        }
    }
    
    func doRefetchOrderById() {
        Logger.info("Starting: doRefetchOrderById")
        if let channelHeaders = dataStore.channelHeaders,
           let pendingOrderId = dataStore.currentPendingOrder?.orderId{
            Logger.debug("CartTabView -> doRefetchOrderById")
            dataStore.apiCallService.sendGetOrderByID(channelHeaders: channelHeaders, orderId: pendingOrderId)
        }
    }
    
    func doCartPaymentPostRequest() {
        Logger.info("Starting: doCartPaymentPostRequest")
    }
    
    var cartItemsSections: some View {
        Section {
            ForEach(offerItemSelections.items) { offerItem in
                OfferGridTile(offerItem: .constant(offerItem))
            }
        } header: {
            Text("Cart Items")
        }
    }
    
    var checkoutSection: some View {
        Section {
            //Text("Checkout Steps")
            if let currentPendingOrder = dataStore.currentPendingOrder {
                Text("Current Order ID: \(currentPendingOrder.orderIdDescription())")
                Button("Refetch Order By ID") {
                    doRefetchOrderById()
                }
                Button("CartPaymentPostRequest") {
                    doCartPaymentPostRequest()
                }
            } else {
                Button("Create Cart") {
                    doCreateCart()
                }
            }
            
        } header: {
            Text("Checkout")
        }
    }
    var body: some View {
        List(CartListSections.allCases) { nextSection in
            switch nextSection {
            case .OfferItems:
                cartItemsSections
            case .Checkout:
                checkoutSection
            }
            
        }
    }

}

struct CartTabView_Previews: PreviewProvider {
    static var previews: some View {
        CartTabView(offerItemSelections: .constant(PreviewMocks.Mock_OfferItemSelections()))
    }
}
