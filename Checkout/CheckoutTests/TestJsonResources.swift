//
//  TestJsonResources.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/24/23.
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
    
    static var guestOrderCustomer_Demo: OrderCustomer? {
        get {
            let file: URL! = testBundle.url(forResource: "guestOrderCustomer_Demo", withExtension: "json")
            let data: Data! = try! Data(contentsOf: file)
            let decodedResult = CodableHelper.decode(OrderCustomer.self, from: data)
            switch decodedResult {
            case .failure(_):
                return nil
            case .success(let guestOrderCustomer):
                return guestOrderCustomer
            }
        }
    }
}
