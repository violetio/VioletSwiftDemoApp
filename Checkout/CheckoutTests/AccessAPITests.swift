//
//  AccessAPITests.swift
//  AccessAPITests
//
//  Created by Alan Morford on 3/8/23.
//

import XCTest
@testable import Checkout
import VioletPublicClientAPI

final class AccessAPITests: APIXCTestCase {
    
    func test_Login() throws {
        
        let appCreds = AppCreds.SandBoxTestCreds_Alan()
        
        var myAuthtoken: String = ""
        let expectation = XCTestExpectation(description: "API Call")
        AccessAPI.loginPost(xVioletAppSecret: appCreds.apiSecret,
                            xVioletAppId: appCreds.appID,
                            body: appCreds.loginBody()) { (response, error) in
            guard error == nil else {
                print(error.debugDescription)
                return
            }

            if let resp = response {
                if let tokenReceived = resp.token {
                    myAuthtoken = tokenReceived
                }
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
        print("tokenReceived: \(myAuthtoken)")
        
    }
    
    func test_RefreshAuthTokenGet() throws {

        let appCreds = AppCreds.SandBoxTestCreds()
        var refreshToken = ""
        var myAuthtoken: String = ""
        
        let expectation = XCTestExpectation(description: "API Call")
        AccessAPI.authTokenGet(xVioletToken: refreshToken,
                               xVioletAppSecret: appCreds.apiSecret,
                               xVioletAppId: appCreds.appID) { (response, error) in
            guard error == nil else {
                print(error.debugDescription)
                return
            }

            if let resp = response {
                if let tokenReceived = resp.token {
                    myAuthtoken = tokenReceived
                }
                print("response.token \(String(describing: resp.token))")   
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
        print("tokenReceived: \(myAuthtoken)")
        
    }

}
