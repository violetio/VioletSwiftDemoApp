//
// OrderShippingMethodWrapper.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Order Shipping Method Wrapper */
public struct OrderShippingMethodWrapper: Codable, JSONEncodable, Hashable {

    public var bagId: Int64?
    public var shippingMethods: [OrderShippingMethod]?

    public init(bagId: Int64? = nil, shippingMethods: [OrderShippingMethod]? = nil) {
        self.bagId = bagId
        self.shippingMethods = shippingMethods
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case bagId = "bag_id"
        case shippingMethods = "shipping_methods"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(bagId, forKey: .bagId)
        try container.encodeIfPresent(shippingMethods, forKey: .shippingMethods)
    }
}

