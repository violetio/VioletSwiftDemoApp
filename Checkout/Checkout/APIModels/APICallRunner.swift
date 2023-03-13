//
//  APICallRunner.swift
//  Checkout
//
//  Created by Alan Morford on 3/10/23.
//

import VioletPublicClientAPI

class APICallRunner {
    
    private let logger = Logger()
    
    func loginPost(appCreds: AppCreds = AppCreds.SandBoxTestCreds_Alan()) {
        logger.log("     ---- loginPost ---")
        AccessAPI.loginPost(xVioletAppSecret: appCreds.apiSecret,
                            xVioletAppId: appCreds.appID,
                            body: appCreds.loginBody()) { (response, error) in
            guard error == nil else {
                self.logger.info("     ---- loginPost: error:")
                self.logger.error(error.debugDescription)
                return
            }

            if let resp = response {
                if let tokenReceived = resp.token {
                    self.logger.info("     ---- loginPost: token: \(tokenReceived)")
                } else {
                    self.logger.info("     ---- loginPost: NO TOKEN")
                }
                
            }
        }
        
    }
    
}
