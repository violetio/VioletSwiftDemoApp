//
//  EnvTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/10/23.
//

import XCTest
@testable import Checkout

final class EnvTests: XCTestCase {


    func test_sandbox_app_vars() throws {
        let vars = EnvVars()
        XCTAssertNotEqual(vars.sandbox_app_secret, "")
        XCTAssertNotEqual(vars.sandbox_app_id, 0)
        XCTAssertNotEqual(vars.sandbox_app_username, "")
        XCTAssertNotEqual(vars.sandbox_app_password, "")
    }

}
