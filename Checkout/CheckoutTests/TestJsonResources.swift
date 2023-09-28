//
//  TestJsonResources.swift
//  CheckoutTests
//
//  Created on 3/24/23.
//

import Foundation
import Violet

class TestJsonResources {
    var testBundle: Bundle {
        get {
            return Bundle(for: type(of: self))
        }
    }
    
    static var testBundle: Bundle {
        get {
            return Bundle(for: TestJsonResources.self)
        }
    }
    
}
