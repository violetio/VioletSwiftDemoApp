//
// Webhook.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** External Hook Event */
public struct Webhook: Codable, JSONEncodable, Hashable {

    public enum Event: String, Codable, CaseIterable {
        case orderUpdated = "ORDER_UPDATED"
        case orderShipped = "ORDER_SHIPPED"
        case orderCompleted = "ORDER_COMPLETED"
        case orderCancelled = "ORDER_CANCELLED"
        case orderRefunded = "ORDER_REFUNDED"
        case orderReturned = "ORDER_RETURNED"
        case offerCreated = "OFFER_CREATED"
        case offerUpdated = "OFFER_UPDATED"
        case offerRemoved = "OFFER_REMOVED"
    }
    public enum Status: String, Codable, CaseIterable {
        case inactive = "INACTIVE"
        case active = "ACTIVE"
        case disabled = "DISABLED"
    }
    public var id: Int?
    public var appId: Int?
    /** The event being triggered */
    public var event: Event
    /** Remote endpoint the webhook posts against. */
    public var remoteEndpoint: String
    /** Status of the webhook */
    public var status: Status?
    /** Date of creation */
    public var dateCreated: Date?
    /** Date of last update */
    public var dateLastModified: Date?

    public init(id: Int? = nil, appId: Int? = nil, event: Event, remoteEndpoint: String, status: Status? = nil, dateCreated: Date? = nil, dateLastModified: Date? = nil) {
        self.id = id
        self.appId = appId
        self.event = event
        self.remoteEndpoint = remoteEndpoint
        self.status = status
        self.dateCreated = dateCreated
        self.dateLastModified = dateLastModified
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case appId = "app_id"
        case event
        case remoteEndpoint = "remote_endpoint"
        case status
        case dateCreated = "date_created"
        case dateLastModified = "date_last_modified"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(appId, forKey: .appId)
        try container.encode(event, forKey: .event)
        try container.encode(remoteEndpoint, forKey: .remoteEndpoint)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(dateLastModified, forKey: .dateLastModified)
    }
}
