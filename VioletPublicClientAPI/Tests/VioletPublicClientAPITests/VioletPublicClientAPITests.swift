import XCTest
@testable import VioletPublicClientAPI

final class VioletPublicClientAPITests: XCTestCase {
    func test_GetAuthTokenGet() throws {
        var sandbox_Email = "alan+sandbox@violet.io"
        
        var sandbox_AppID = 10199
        var sandbox_API_Secret = "c50e054620634e9aacc22f5529b2782c"
        var Sandbox_API_Public = "948018f492264759b0eeec3884ac640d"
        
        AccessAPI.authTokenGet(xVioletToken: nil,
                               xVioletAppSecret: sandbox_API_Secret,
                               xVioletAppId: sandbox_AppID) { (response, error) in
            guard error == nil else {
                print(error)
                return
            }

            if (response) {
                dump(response)
            }
        }
        
        
        
    }
    
    
}
