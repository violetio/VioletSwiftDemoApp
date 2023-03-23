//
// OrderAddress.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** The shipping or billing address of a user placing an order */
public struct OrderAddress: Codable, JSONEncodable, Hashable {

    public enum ModelType: String, Codable, CaseIterable {
        case shipping = "SHIPPING"
        case billing = "BILLING"
    }
    /** Name on Address */
    public var name: String?
    /** City */
    public var city: String
    /** State Abbreviation */
    public var state: String
    /** Country ISO2 Code */
    public var country: String
    /** Postal/Zip Code */
    public var postalCode: String
    /** Phone Number */
    public var phone: String?
    /** Address Type */
    public var type: ModelType
    /** First line of the Address */
    public var address1: String
    /** Second line of the Address */
    public var address2: String?

    public init(name: String? = nil, city: String, state: String, country: String, postalCode: String, phone: String? = nil, type: ModelType, address1: String, address2: String? = nil) {
        self.name = name
        self.city = city
        self.state = state
        self.country = country
        self.postalCode = postalCode
        self.phone = phone
        self.type = type
        self.address1 = address1
        self.address2 = address2
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case city
        case state
        case country
        case postalCode = "postal_code"
        case phone
        case type
        case address1 = "address_1"
        case address2 = "address_2"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(country, forKey: .country)
        try container.encode(postalCode, forKey: .postalCode)
        try container.encodeIfPresent(phone, forKey: .phone)
        try container.encode(type, forKey: .type)
        try container.encode(address1, forKey: .address1)
        try container.encodeIfPresent(address2, forKey: .address2)
    }
}

