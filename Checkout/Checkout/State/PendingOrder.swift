//
//  PendingOrder.swift
//  Checkout
//
//  Created by Alan Morford on 5/1/23.
//

import Combine
import SwiftUI
import Violet
import Foundation

class PendingOrder: ObservableObject {
    
    @Published var orderId: Int64
    @Published var bags: [Bag]
    @Published var customerUserId: Int64?
    @Published var firstName: String?
    
    init(orderId: Int64, bags: [Bag]=[], customerUserId: Int64?=nil, firstName: String?) {
        self.orderId = orderId
        self.bags = bags
        self.customerUserId = customerUserId
        self.firstName = firstName
    }
    
    func orderIdDescription() -> String {
        return String(reflecting: orderId)
    }
    
    func update(from maybeAnOrder: Order?) {
        guard let anOrder = maybeAnOrder else {
            return
        }
        guard let anOrderId = anOrder.id else {
            return
        }
        self.orderId = anOrderId
        self.bags = anOrder.bags?.compactMap { $0 } ?? []
        self.customerUserId = anOrder.customer?.userId
        self.firstName = anOrder.customer?.firstName
    }
    
    static func fromOrder(_ maybeAnOrder: Order?) -> PendingOrder? {
        guard let anOrder = maybeAnOrder else {
            return nil
        }
        guard let anOrderId = anOrder.id else {
            return nil
        }

        let bagArray: [Bag] = anOrder.bags?.compactMap { $0 } ?? []
        
        return PendingOrder(orderId: anOrderId,
                            bags: bagArray,
                            customerUserId: anOrder.customer?.userId,
                            firstName: anOrder.customer?.firstName)
    }
}
