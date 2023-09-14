//
//  APICallActivityState.swift
//  Checkout
//
//  Created on 9/5/23
//

import SwiftUI
import Violet
import Combine

/**
 
 */
class APICallActivityState: ObservableObject {
    @Published var pendingAPICallCount: Int = 0
    
    var isPendingAPICall : Bool { pendingAPICallCount > 0 }
    init() {
    }
    
    func increment() {
        pendingAPICallCount += 1
        //Logger.debug("increment: pendingAPICallCount: \(pendingAPICallCount)")
    }
    
    func decrement() {
        if pendingAPICallCount>0 {
            pendingAPICallCount -= 1
        }
        //Logger.debug("decrement: pendingAPICallCount: \(pendingAPICallCount)")
    }
}

