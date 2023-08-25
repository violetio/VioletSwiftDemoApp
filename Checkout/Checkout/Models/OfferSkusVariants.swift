//
//  OfferSkusVariants.swift
//  Checkout
//
//  Created on 8/20/23
//

import Foundation
import Violet

class OfferSkusVariants {
    let offer: Offer
    var skuIdSetMap: SkuIdSetMap
    var variantViewModels: [VariantViewModel]
    
    init(offer: Offer) {
        self.offer = offer
        self.skuIdSetMap = Self.buildSkuIdSetMap(offer: offer)
        self.variantViewModels = Self.buildVariantViewModels(offer: offer)
    }
    
    func skuID(setNamesToIntersect: [String]) -> Int64? {
        return OfferSkusVariants.skuID(setNamesToIntersect: setNamesToIntersect, skuIdSetMap: self.skuIdSetMap)
    }
    
    func intersectingSkuIdSetMap(key: String) -> SkuIdSetMap {
        var result: SkuIdSetMap = [:]
        guard let matchedSkuIdSet = skuIdSetMap[key] else {
            return result
        }
        
        skuIdSetMap.forEach { (okey: String, value: Set<Int64>) in
            if !value.intersection(matchedSkuIdSet).isEmpty {
                result[okey] = value
            }
        }
        return result
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
    
    static func buildVariantViewModels(offer: Offer) -> [VariantViewModel] {
        var variantViewModels: [VariantViewModel] = []
        var variantNameToValueNameSetsMap: [String: Set<String>] = [:]
        guard let offerSkus = offer.skus else { return variantViewModels }
        
        offerSkus.forEach { offerSku in

            if let variantValuesSet = offerSku.variantValues {
                for variantValue in variantValuesSet {
                    if let name = variantValue.variant,
                       let value = variantValue.value {
                        if var valueNameSet = variantNameToValueNameSetsMap[name] {
                            valueNameSet.insert(value)
                            variantNameToValueNameSetsMap[name] = valueNameSet
                        } else {
                            variantNameToValueNameSetsMap[name] = Set<String>(arrayLiteral: value)
                        }
                    }
                }
            }
        }
        
        variantNameToValueNameSetsMap.keys.forEach { variantName in
            if let valueNameSet = variantNameToValueNameSetsMap[variantName] {
                variantViewModels.append(VariantViewModel(name: variantName, valueNamesSet: valueNameSet))
            }
        }
        //Logger.debug("variantViewModels: \(variantViewModels)")
        return variantViewModels
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
