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
    
    init(orderId: Int64) {
        self.orderId = orderId
    }
    
    func orderIdDescription() -> String {
        return String(reflecting: orderId)
    }
}
