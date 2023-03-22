//
// Sku.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Stock Keeping Unit */
public struct Sku: Codable, JSONEncodable, Hashable {

    public enum TaxType: String, Codable, CaseIterable {
        case _default = "DEFAULT"
        case apparel = "APPAREL"
        case service = "SERVICE"
    }
    public enum ModelType: String, Codable, CaseIterable {
        case physical = "PHYSICAL"
        case digital = "DIGITAL"
        case virtual = "VIRTUAL"
    }
    public enum Status: String, Codable, CaseIterable {
        case unavailable = "UNAVAILABLE"
        case available = "AVAILABLE"
        case disabledUnavailable = "DISABLED_UNAVAILABLE"
        case disabledAvailable = "DISABLED_AVAILABLE"
        case forDeletion = "FOR_DELETION"
        case archived = "ARCHIVED"
    }
    public var id: Int64?
    /** ID of the Offer */
    public var offerId: Int64
    /** ID of the Merchant */
    public var merchantId: Int
    /** ID of the SKU on the External Ecom Platform */
    public var externalId: String?
    /** Sku Name */
    public var name: String?
    /** Amazon Standard Identification Number */
    public var asin: String?
    /** Global Trade Item Number */
    public var gtin: String?
    /** Universal Product Code */
    public var upc: String?
    /** European Article Number */
    public var ean: String?
    /** International Standard Book Number */
    public var isbn: String?
    /** Is the Product in Stock */
    public var inStock: Bool? = false
    /** Quantity Available */
    public var quantityAvailable: Int?
    /** Is the SKUs inventory tracked */
    public var inventoryTracked: Bool? = false
    /** Sale Price of the SKU */
    public var salePrice: Int
    /** Retail Price of the SKU */
    public var retailPrice: Int?
    /** The starting currency of this SKU */
    public var currency: String
    /** Is the product taxable */
    public var taxable: Bool? = false
    /** Type of Tax on this SKU */
    public var taxType: TaxType?
    /** Sku Albums */
    public var albums: [Album]?
    /** Variant Values that apply to this SKU */
    public var variantValues: [SkuVariantValue]?
    public var type: ModelType?
    /** SKU Status */
    public var status: Status?
    /** Date of SKU creation */
    public var dateCreated: Date?
    /** Date of last SKU update */
    public var dateLastModified: Date?
    public var skuDimensions: SkuDimensions?

    public init(id: Int64? = nil, offerId: Int64, merchantId: Int, externalId: String? = nil, name: String? = nil, asin: String? = nil, gtin: String? = nil, upc: String? = nil, ean: String? = nil, isbn: String? = nil, inStock: Bool? = false, quantityAvailable: Int? = nil, inventoryTracked: Bool? = false, salePrice: Int, retailPrice: Int? = nil, currency: String, taxable: Bool? = false, taxType: TaxType? = nil, albums: [Album]? = nil, variantValues: [SkuVariantValue]? = nil, type: ModelType? = nil, status: Status? = nil, dateCreated: Date? = nil, dateLastModified: Date? = nil, skuDimensions: SkuDimensions? = nil) {
        self.id = id
        self.offerId = offerId
        self.merchantId = merchantId
        self.externalId = externalId
        self.name = name
        self.asin = asin
        self.gtin = gtin
        self.upc = upc
        self.ean = ean
        self.isbn = isbn
        self.inStock = inStock
        self.quantityAvailable = quantityAvailable
        self.inventoryTracked = inventoryTracked
        self.salePrice = salePrice
        self.retailPrice = retailPrice
        self.currency = currency
        self.taxable = taxable
        self.taxType = taxType
        self.albums = albums
        self.variantValues = variantValues
        self.type = type
        self.status = status
        self.dateCreated = dateCreated
        self.dateLastModified = dateLastModified
        self.skuDimensions = skuDimensions
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case offerId = "offer_id"
        case merchantId = "merchant_id"
        case externalId = "external_id"
        case name
        case asin
        case gtin
        case upc
        case ean
        case isbn
        case inStock = "in_stock"
        case quantityAvailable = "quantity_available"
        case inventoryTracked = "inventory_tracked"
        case salePrice = "sale_price"
        case retailPrice = "retail_price"
        case currency
        case taxable
        case taxType = "tax_type"
        case albums
        case variantValues = "variant_values"
        case type
        case status
        case dateCreated = "date_created"
        case dateLastModified = "date_last_modified"
        case skuDimensions = "sku_dimensions"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(offerId, forKey: .offerId)
        try container.encode(merchantId, forKey: .merchantId)
        try container.encodeIfPresent(externalId, forKey: .externalId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(asin, forKey: .asin)
        try container.encodeIfPresent(gtin, forKey: .gtin)
        try container.encodeIfPresent(upc, forKey: .upc)
        try container.encodeIfPresent(ean, forKey: .ean)
        try container.encodeIfPresent(isbn, forKey: .isbn)
        try container.encodeIfPresent(inStock, forKey: .inStock)
        try container.encodeIfPresent(quantityAvailable, forKey: .quantityAvailable)
        try container.encodeIfPresent(inventoryTracked, forKey: .inventoryTracked)
        try container.encode(salePrice, forKey: .salePrice)
        try container.encodeIfPresent(retailPrice, forKey: .retailPrice)
        try container.encode(currency, forKey: .currency)
        try container.encodeIfPresent(taxable, forKey: .taxable)
        try container.encodeIfPresent(taxType, forKey: .taxType)
        try container.encodeIfPresent(albums, forKey: .albums)
        try container.encodeIfPresent(variantValues, forKey: .variantValues)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(dateLastModified, forKey: .dateLastModified)
        try container.encodeIfPresent(skuDimensions, forKey: .skuDimensions)
    }
}

