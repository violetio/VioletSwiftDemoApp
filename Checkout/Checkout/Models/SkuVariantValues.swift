//
//  SkuVariantValues.swift
//  Checkout
//
//  Created on 8/20/23
//

import Foundation
import Violet

class SkuVariantValues {
    let sku: Sku
    var skuId: Int64 = 0
    var variantNameValueMap: [String: String] = [:]
    
    init(sku: Sku) {
        self.sku = sku
        self.load(sku: sku)
    }
    
    func load(sku: Sku) {
        self.skuId = sku.id ?? 0
        if let variantValuesSet = sku.variantValues {
            for variantValue in variantValuesSet {
                if let name = variantValue.variant,
                   let value = variantValue.value {
                    variantNameValueMap[name] = value
                    
                }
            }
        }
    }
    
    static func inspect(sku: Sku) {
        if let skuId = sku.id {
            Logger.debug("SkuVariantValues: skuId = \(skuId)")
            if let variantValuesSet = sku.variantValues {
                Logger.debug("SkuVariantValues: variantValuesSet.count = \(variantValuesSet.count)")
            }
        }
    }
}

class OfferSkusVariants {
    let offer: Offer
    var skuIdSetMap: SkuIdSetMap
    
    init(offer: Offer) {
        self.offer = offer
        self.skuIdSetMap = Self.buildSkuIdSetMap(offer: offer)
    }
    
    func skuID(setNamesToIntersect: [String]) -> Int64? {
        return OfferSkusVariants.skuID(setNamesToIntersect: setNamesToIntersect, skuIdSetMap: self.skuIdSetMap)
    }
    
    static func skuID(setNamesToIntersect: [String], skuIdSetMap: SkuIdSetMap) -> Int64? {
        var result: Int64? = nil
        
        var currentSkuIdSet = Set<Int64>()
        for nextKey in setNamesToIntersect {
            if let skuIDsFound = skuIdSetMap[nextKey] {
                if currentSkuIdSet.isEmpty {
                    currentSkuIdSet = skuIDsFound
                    //Logger.debug("currentSkuIdSet Init: \(currentSkuIdSet)")
                } else {
                    currentSkuIdSet = currentSkuIdSet.intersection(skuIDsFound)
                    if currentSkuIdSet.count == 1,
                        let first = currentSkuIdSet.first {
                        result = first
                        //Logger.debug("Single Sku: \(first)")
                        return result
                    }
                    //Logger.info("currentSkuIdSet Intersect: \(currentSkuIdSet)")
                }
            }
        }
        return result
    }
    
    static func buildSkuIdSetMap(offer: Offer) -> SkuIdSetMap {
        var skuSetIDsMap: SkuIdSetMap = [:]
        guard let offerSkus = offer.skus else { return skuSetIDsMap }
        
        offerSkus.forEach { offerSku in

            if let skuId = offerSku.id,
               let variantValuesSet = offerSku.variantValues {
                for variantValue in variantValuesSet {
                    if let name = variantValue.variant,
                       let value = variantValue.value {
                        let key = "\(name).\(value)"
                        if var skuIdSet = skuSetIDsMap[key] {
                            skuIdSet.insert(skuId)
                            skuSetIDsMap[key] = skuIdSet
                        } else {
                            skuSetIDsMap[key] = Set<Int64>(arrayLiteral: skuId)
                        }
                        
                    }
                }
            }
            
        }
        return skuSetIDsMap
    }
}
