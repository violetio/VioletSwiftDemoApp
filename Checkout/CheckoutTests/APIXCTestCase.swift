//
//  APIXCTestCase.swift
//  CheckoutTests
//
//  Created by Alan Morford on 3/20/23.
//

@testable import Checkout
import Combine
import SwiftUI
import VioletPublicClientAPI
import XCTest

class APIXCTestCase: XCTestCase {
    
    let timeout: TimeInterval = 5
    let pageTimeout: TimeInterval = 15
    
    let loginPostJsonResponse_fileName = "loginPostJsonResponse.json"
    let timeout_5s: TimeInterval = 5
    let timeout_10s: TimeInterval = 10
    let timeout_15s: TimeInterval = 15
    let appCreds = AppCreds()

    func persistData(fileName: String, data: Data) throws {
        let cachesDir = FileDirectory.CachesFileDirectory()
        let targetWritePath = FilePath(fileName: fileName, fileDirectory: cachesDir)!

        try data.write(to: targetWritePath.fileURL, options: .noFileProtection)
        Logger.debug("Wrote Caches file: \(targetWritePath.fileURL)")
    }

    func reloadData(fileName: String) -> Data? {
        let cachesDir = FileDirectory.CachesFileDirectory()
        let filePath = FilePath(fileName: fileName, fileDirectory: cachesDir)!
        return try? Data(contentsOf: filePath.fileURL)
    }

    func lastLoginPost_Token() -> String? {
        guard let jsonData = reloadData(fileName: loginPostJsonResponse_fileName) else {
            return nil
        }

        let decodeResult = CodableHelper.decode(LoginResponse.self, from: jsonData)
        var token: String? = nil
        switch decodeResult {
        case .failure:
            token = nil
        case .success(let loginPostRequest):
            token = loginPostRequest.token!
        }
        return token
    }

    func lastLoginPost_RefreshToken() -> String? {
        guard let jsonData = reloadData(fileName: loginPostJsonResponse_fileName) else {
            return nil
        }

        let decodeResult = CodableHelper.decode(LoginResponse.self, from: jsonData)
        var refreshToken: String? = nil
        switch decodeResult {
        case .failure:
            refreshToken = nil
        case .success(let loginPostRequest):
            refreshToken = loginPostRequest.refreshToken!
        }
        return refreshToken
    }
    
}