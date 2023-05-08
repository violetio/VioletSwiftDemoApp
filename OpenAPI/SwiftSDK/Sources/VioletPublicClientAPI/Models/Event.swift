//
// Event.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Event: Codable, JSONEncodable, Hashable {

    public enum ModelType: String, Codable, CaseIterable {
        case create = "create"
        case update = "update"
        case delete = "delete"
    }
    public var id: Int64?
    /** App ID */
    public var appId: Int64
    /** User ID */
    public var userId: Int64
    /** The type of event */
    public var type: ModelType
    /** Message event body */
    public var message: String
    /** Date of account creation */
    public var dateCreated: Date?
    /** Date of last account update */
    public var dateLastModified: Date?

    public init(id: Int64? = nil, appId: Int64, userId: Int64, type: ModelType, message: String, dateCreated: Date? = nil, dateLastModified: Date? = nil) {
        self.id = id
        self.appId = appId
        self.userId = userId
        self.type = type
        self.message = message
        self.dateCreated = dateCreated
        self.dateLastModified = dateLastModified
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case appId = "app_id"
        case userId = "user_id"
        case type
        case message
        case dateCreated = "date_created"
        case dateLastModified = "date_last_modified"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(appId, forKey: .appId)
        try container.encode(userId, forKey: .userId)
        try container.encode(type, forKey: .type)
        try container.encode(message, forKey: .message)
        try container.encodeIfPresent(dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(dateLastModified, forKey: .dateLastModified)
    }
}
