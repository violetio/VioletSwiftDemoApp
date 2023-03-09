//
// PageProduct.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct PageProduct: Codable, JSONEncodable, Hashable {

    public var totalPages: Int?
    public var totalElements: Int64?
    public var size: Int?
    public var content: [Product]?
    public var number: Int?
    public var sort: AnyCodable?
    public var first: Bool? = false
    public var last: Bool? = false
    public var numberOfElements: Int?

    public init(totalPages: Int? = nil, totalElements: Int64? = nil, size: Int? = nil, content: [Product]? = nil, number: Int? = nil, sort: AnyCodable? = nil, first: Bool? = false, last: Bool? = false, numberOfElements: Int? = nil) {
        self.totalPages = totalPages
        self.totalElements = totalElements
        self.size = size
        self.content = content
        self.number = number
        self.sort = sort
        self.first = first
        self.last = last
        self.numberOfElements = numberOfElements
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case totalPages = "total_pages"
        case totalElements = "total_elements"
        case size
        case content
        case number
        case sort
        case first
        case last
        case numberOfElements = "number_of_elements"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(totalPages, forKey: .totalPages)
        try container.encodeIfPresent(totalElements, forKey: .totalElements)
        try container.encodeIfPresent(size, forKey: .size)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(sort, forKey: .sort)
        try container.encodeIfPresent(first, forKey: .first)
        try container.encodeIfPresent(last, forKey: .last)
        try container.encodeIfPresent(numberOfElements, forKey: .numberOfElements)
    }
}

