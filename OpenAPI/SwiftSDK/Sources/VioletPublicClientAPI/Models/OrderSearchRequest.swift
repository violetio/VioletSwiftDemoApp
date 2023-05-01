//
// OrderSearchRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Search Request */
public struct OrderSearchRequest: Codable, JSONEncodable, Hashable {

    /** User ID */
    public var userId: Int64?
    /** Merchant ID */
    public var merchantId: Int?
    /** Referral ID */
    public var referralId: String?

    public init(userId: Int64? = nil, merchantId: Int? = nil, referralId: String? = nil) {
        self.userId = userId
        self.merchantId = merchantId
        self.referralId = referralId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userId = "user_id"
        case merchantId = "merchant_id"
        case referralId = "referral_id"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(userId, forKey: .userId)
        try container.encodeIfPresent(merchantId, forKey: .merchantId)
        try container.encodeIfPresent(referralId, forKey: .referralId)
    }
}

