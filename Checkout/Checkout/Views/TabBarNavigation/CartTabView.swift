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
    case Customer
    case GetShippingMethods
    
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
    
    func createOrderAddress() -> OrderAddress {
        return OrderAddress(city: "Brooklyn", state: "NY", country: "US", postalCode: "11206", type: .shipping, address1: "999 Meserole Street")
    }
    func createGuestOrderCustomer() -> GuestOrderCustomer {
        return GuestOrderCustomer(firstName: "Ishan",
                                  lastName: "Wallet Checkout Tests",
                                  email: "ishan.guru+test_order@violet.io", shippingAddress: createOrderAddress(), billingAddress: nil, sameAddress: true)
        
    }
    
    func doAddCartGuestCustomer() {
        Logger.info("Starting: doCartPaymentPostRequest")
        if let channelHeaders = dataStore.channelHeaders,
           let pendingOrderId = dataStore.currentPendingOrder?.orderId{
            Logger.debug("CartTabView -> doCartPaymentPostRequest")
            dataStore.apiCallService.sendCartCustomer(channelHeaders: channelHeaders, orderId: pendingOrderId, customer: createGuestOrderCustomer())
        }
    }
    
    var cartItemsSection: some View {
        Section {
            ForEach(offerItemSelections.items) { offerItem in
                OfferGridTile(offerItem: .constant(offerItem))
            }
        } header: {
            Text("Cart Items")
        }
    }
    
    var customerSection: some View {
        Section {
            if let customerUserId = dataStore.currentPendingOrder?.customerUserId {
                Text("Customer User ID: \(String(reflecting: customerUserId))")
                Text("First Name: \(String(reflecting: dataStore.currentPendingOrder?.firstName))")
            } else {
                Button("Add Guest Order Customer") {
                    doAddCartGuestCustomer()
                }
            }
        } header: {
            Text("Customer")
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
                cartItemsSection
            case .Checkout:
                checkoutSection
            case .Customer:
                customerSection
            case .GetShippingMethods:
                CartShippingMethodsSectionView()
            }
            
        }
    }

}

struct CartTabView_Previews: PreviewProvider {
    static var previews: some View {
        CartTabView(offerItemSelections: .constant(PreviewMocks.Mock_OfferItemSelections()))
    }
}
