//
//  AppIDAndSecret.swift
//  Checkout
//
//

protocol AppIDAndSecret {
    var appID: Int64 { get }
    var apiSecret: String { get }
}

protocol AuthAndRefreshToken {
    var token: String { get }
    var refreshToken: String { get }
}
