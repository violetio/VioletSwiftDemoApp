//
//  CountryCodesArrayTests.swift
//  CheckoutTests
//
//  Created on 8/24/23
//

import XCTest
@testable import Checkout

final class CountryCodesArrayTests: XCTestCase {

    func testExample() throws {
        let result = CountryCodesArray.loadJson()
        Logger.debug("result: \(result)")
    }

}
