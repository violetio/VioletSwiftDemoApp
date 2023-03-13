//
//  APICallRunner.swift
//  Checkout
//
//  Created by Alan Morford on 3/10/23.
//

import VioletPublicClientAPI

class APICallRunner {
    
    func loginPost() {
        print("     ---- loginPost ---")
        let appCreds = AppCreds.SandBoxTestCreds_Alan()
        AccessAPI.loginPost(xVioletAppSecret: appCreds.apiSecret,
                            xVioletAppId: appCreds.appID,
                            body: appCreds.loginBody()) { (response, error) in
            guard error == nil else {
                print("     ---- loginPost: error:")
                print(error.debugDescription)
                return
            }

            if let resp = response {
                if let tokenReceived = resp.token {
                    print("     ---- loginPost: token: \(tokenReceived)")
                } else {
                    print("     ---- loginPost: NO TOKEN")
                }
                
            }
        }
        
    }
    
}
