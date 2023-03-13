//
//  EnvTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/10/23.
//

import XCTest
@testable import Checkout

final class EnvTests: XCTestCase {


    func test_EnvVars_Default() throws {
        let vars = EnvVars()
        XCTAssertNotEqual(vars.sandbox_app_secret, "")
        XCTAssertNotEqual(vars.sandbox_app_id, 0)
        XCTAssertNotEqual(vars.sandbox_app_username, "")
        XCTAssertNotEqual(vars.sandbox_app_password, "")
    }
    
    func test_EnvVars_Alan() throws {
        let vars = EnvVars.Alan()
        XCTAssertNotEqual(vars.sandbox_app_secret, "")
        XCTAssertNotEqual(vars.sandbox_app_id, 0)
        XCTAssertNotEqual(vars.sandbox_app_username, "")
        XCTAssertNotEqual(vars.sandbox_app_password, "")
    }
    
    func test_EnvVars_Ishan() throws {
        let vars = EnvVars.Ishan()
        XCTAssertNotEqual(vars.sandbox_app_secret, "")
        XCTAssertNotEqual(vars.sandbox_app_id, 0)
        XCTAssertNotEqual(vars.sandbox_app_username, "")
        XCTAssertNotEqual(vars.sandbox_app_password, "")
    }

}
