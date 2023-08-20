//
//  OfferVariants.swift
//  Checkout
//
//  Created on 8/20/23
//

import Foundation
import Violet

class OfferVariants {
    let offer: Offer
    var skuIdSetMap: SkuIdSetMap
    
    init(offer: Offer) {
        self.offer = offer
        self.skuIdSetMap = Self.buildSkuIdSetMap(offer: offer)
    }
    
    func skuID(setNamesToIntersect: [String]) -> Int64? {
        var result: Int64? = nil
        
        var currentSkuIdSet = Set<Int64>()
        for nextKey in setNamesToIntersect {
            if let skuIDsFound = self.skuIdSetMap[nextKey] {
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

    static func buildSkuIdSetMap(offer: Offer) -> SkuIdSetMap{
        var skuSetIDsMap: SkuIdSetMap = [:]
        guard let variantArray = offer.variants else { return skuSetIDsMap }
        
        for aVariant in variantArray {
            guard let variantName = aVariant.name else { continue }
            guard let variantValuesArray = aVariant.values else { continue }
            for aVariantValue in variantValuesArray {
                guard let aVariantValueName = aVariantValue.name else { continue }
                guard let skuIDSet = aVariantValue.skuIds else { continue }
                skuSetIDsMap["\(variantName).\(aVariantValueName)"] = skuIDSet
            }
        }
        return skuSetIDsMap
    }

//    func getArray() {
//        let filtered = self.variants.filter { aVariant in
//            if let variantValues = aVariant.values,
//               variantValues.count > 0 {
//                return true
//            }
//            return false
//        }
//    }
}
