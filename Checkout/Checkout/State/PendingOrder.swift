//
//  PendingOrder.swift
//  Checkout
//
//  Created by Alan Morford on 5/1/23.
//

import Combine
import SwiftUI
import VioletPublicClientAPI
import Foundation

class PendingOrder: ObservableObject {
    
    @Published var orderId: Int64
    @Published var bags: [Bag]
    @Published var customerUserId: Int64?
    
    init(orderId: Int64, bags: [Bag]=[], customerUserId: Int64?=nil) {
        self.orderId = orderId
        self.bags = bags
        self.customerUserId = customerUserId
    }
    
    func orderIdDescription() -> String {
        return String(reflecting: orderId)
    }
    
    static func fromOrder(_ maybeAnOrder: Order?) -> PendingOrder? {
        guard let anOrder = maybeAnOrder else {
            return nil
        }
        guard let anOrderId = anOrder.id else {
            return nil
        }

        let bagArray: [Bag] = anOrder.bags?.compactMap { $0 } ?? []
        
        return PendingOrder(orderId: anOrderId, bags: bagArray, customerUserId: anOrder.customer?.userId)
    }
}
