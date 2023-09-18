//
//  AppStore+Features.swift
//  Checkout
//
//  Created on 9/18/23
//

import Foundation

extension AppStore {
    
    struct DemoFeatures: OptionSet {
        let rawValue: Int
        
        static let pdpApplePay = DemoFeatures(rawValue: 1 << 0)
        static let reviewApplePay = DemoFeatures(rawValue: 1 << 1)
        
        static let all: DemoFeatures = [.pdpApplePay]
        static let supported: DemoFeatures = [.reviewApplePay]
        
        var isSupported:  Bool {
            return Self.supported.contains(self)
        }
    }
}
