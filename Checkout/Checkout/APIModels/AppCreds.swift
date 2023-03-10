//
//  Sandbox.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import VioletPublicClientAPI

struct AppCreds {
    let appID: Int64// = 10199
    let apiSecret: String// = "c50e054620634e9aacc22f5529b2782c"
    var token: String// = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJldmFuZHJvLmdvbWVzQHZpb2xldC5pbyIsInNjb3BlcyI6WyJST0xFX1JFRlJFU0hfVE9LRU4iXSwicGVybWlzc2lvbnMiOlsiUk9MRV9ERVZFTE9QRVIiXSwiZGV2ZWxvcGVyX2lkIjoxMDI5MCwibWVyY2hhbnRfaWRzIjpbXSwiaXNzIjoiaHR0cHM6Ly92aW9sZXQuaW8iLCJqdGkiOiJiNDg5MTE2Mi04ZDRiLTRkYjMtYjllNi00OGJkOGQzYjczMWUiLCJpYXQiOjE2NTEwMDI5MTksImV4cCI6MjEyNDM4ODUxOX0.B1o5_4UIv2ybL5-Y4Mrq7g5z33iEWfh3-tCRDET-PSMTNuvsh7HZrEOfDh3egPGvbBMzGeoJKVjHYnM5VExIXA"
    let username: String
    let password: String
    
    init(appID: Int64, apiSecret: String, token: String, username: String, password: String) {
        self.appID = appID
        self.apiSecret = apiSecret
        self.token = token
        self.username = username
        self.password = password
    }
    
    init(_ envVars: EnvVars) {
        self.init(appID: envVars.sandbox_app_id,
                  apiSecret: envVars.sandbox_app_secret,
                  token: "",
                  username: envVars.sandbox_app_username,
                  password: envVars.sandbox_app_password)
    }
    
    func loginBody() -> LoginRequest {
        return LoginRequest(username: self.username, password: self.password)
    }
    
    public mutating func setToken(_ newToken: String) {
        self.token = newToken
    }
    
    static func SandBoxTestCreds() -> AppCreds {
        return AppCreds(EnvVars())
    }
    
    static func SandBoxTestCreds_Alan() -> AppCreds {
        return AppCreds(EnvVars.Alan())
    }
}
