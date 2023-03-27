//
//  TestCheckoutSequence.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/27/23.
//

import Foundation

class TestCheckoutSequence {
    let orderId: Int64
    
    init(orderId: Int64) {
        self.orderId = orderId
    }
    
    static func Order_ID_58374() -> TestCheckoutSequence {
        return TestCheckoutSequence(orderId: 58374)
    }
}
