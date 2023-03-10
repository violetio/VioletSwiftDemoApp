//
//  CheckoutTests.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/8/23.
//

import XCTest
@testable import Checkout
import VioletPublicClientAPI

final class CheckoutTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Login_With_Builder() throws {
        VioletPublicClientAPI.customHeaders["Content-Type"] = "application/json"
        VioletPublicClientAPI.customHeaders["Connection"] = "keep-alive"
        VioletPublicClientAPI.customHeaders["Accept-Encoding"] = "gzip, deflate, br"
        VioletPublicClientAPI.customHeaders["Accept"] = "*/*"
        let appCreds = AppCreds.SandBoxTestCreds()
        
        let request = AccessAPI.loginPostWithRequestBuilder(xVioletAppSecret: appCreds.apiSecret,
                                                  xVioletAppId: appCreds.appID,
                                                  body: appCreds.loginBody())
        
        let expectation = XCTestExpectation(description: "API Call")
        request.execute(VioletPublicClientAPI.apiResponseQueue) { result in
            switch result {
                case let .success(response):
                print("Success")
                print("Response: \(response)")
                    //completion(response.body, nil)
                case let .failure(error):
                print("Failure")
                print("error: \(error)")
                    //completion(nil, error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)

    }
    
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
                print("response.token \(String(describing: resp.token))")
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
        print("tokenReceived: \(myAuthtoken)")
        
    }
    
    func test_RefreshAuthTokenGet() throws {

        let appCreds = AppCreds.SandBoxTestCreds()
        
        var myAuthtoken: String = ""
        let violet_token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJldmFuZHJvLmdvbWVzQHZpb2xldC5pbyIsInNjb3BlcyI6WyJST0xFX1JFRlJFU0hfVE9LRU4iXSwicGVybWlzc2lvbnMiOlsiUk9MRV9ERVZFTE9QRVIiXSwiZGV2ZWxvcGVyX2lkIjoxMDI5MCwibWVyY2hhbnRfaWRzIjpbXSwiaXNzIjoiaHR0cHM6Ly92aW9sZXQuaW8iLCJqdGkiOiJiNDg5MTE2Mi04ZDRiLTRkYjMtYjllNi00OGJkOGQzYjczMWUiLCJpYXQiOjE2NTEwMDI5MTksImV4cCI6MjEyNDM4ODUxOX0.B1o5_4UIv2ybL5-Y4Mrq7g5z33iEWfh3-tCRDET-PSMTNuvsh7HZrEOfDh3egPGvbBMzGeoJKVjHYnM5VExIXA"
        let expectation = XCTestExpectation(description: "API Call")
        AccessAPI.authTokenGet(xVioletToken: appCreds.token,
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
