//
//  CartShippingMethodsSectionView.swift
//  Checkout
//
//  Created by Alan Morford on 5/2/23.
//

import SwiftUI

struct CartShippingMethodsSectionView: View {
    @ObservedObject var dataStore: DataStore = DataStore.shared
    
    func doGetShippingMethods() {
        Logger.info("Starting: doGetShippingMethods")
//        if let channelHeaders = dataStore.channelHeaders,
//           let pendingOrderId = dataStore.currentPendingOrder?.orderId{
//            Logger.debug("CartTabView -> sendGetShippingMethods")
////            dataStore.apiCallService.sendGetShippingMethods(channelHeaders: channelHeaders, orderId: pendingOrderId)
//        }
    }
    
    var body: some View {
        Section {
//            if dataStore.shippingMethodsWrapper == nil {
//                Button("Get Shipping Methods") {
//                    doGetShippingMethods()
//                }
//            } else {
//                OrderShippingMethodWrapperArrayView(orderShippingMethodWrapperArray: $dataStore.shippingMethodsWrapper)
//            }
            
        } header: {
            Text("Shipping Methods")
        }
    }
}

struct CartShippingMethodsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CartShippingMethodsSectionView()
    }
}
