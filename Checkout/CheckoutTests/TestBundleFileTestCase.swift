//
//  TestBundleFileTestCase.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/24/23.
//

import XCTest

class TestBundleFileTestCase: XCTestCase {
    var testBundle: Bundle!
    
    
    override func setUpWithError() throws {
        testBundle = Bundle(for: type(of: self))
    }

}
