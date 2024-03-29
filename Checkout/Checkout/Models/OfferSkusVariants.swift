//
//  OfferSkusVariants.swift
//  Checkout
//
//  Created on 8/20/23
//

import Foundation
import Violet

/**
    A Violet `Offer` Entity may have 1 or more `Sku` entities in its `skus: [...]` array.
    Each `Sku` element has an `id` and 1 or more `SkuVariantValues` entities in its array of `variant_values: [...]`
    The type `OfferSkuVariants` gathers those properties.
 **/
class OfferSkusVariants {
    var skuIdSetMap: SkuIdSetMap
    var variantViewModels: [VariantViewModel]
    var namedVariantViewModels: [String: VariantViewModel]
    
    init(offer: Offer) {
        self.skuIdSetMap = Self.buildSkuIdSetMap(offer: offer)
        let allVariantViewModels = Self.buildVariantViewModels(offer: offer)
        self.variantViewModels = allVariantViewModels
        self.namedVariantViewModels = allVariantViewModels.reduce(into: [String: VariantViewModel](), { partialResult, next in
            partialResult[next.name] = next
        })
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
    
    func availableVariants(key: String) -> Set<String> {
        let intersectingSkuIdSetMap = intersectingSkuIdSetMap(key: key)
        var interestingKeys = Set<String>(intersectingSkuIdSetMap.keys)
        interestingKeys.remove(key)
        return interestingKeys
    }
    
    func availableVariantViewModels(key: String) -> [String: VariantViewModel] {
        let intersectingKeys = availableVariants(key: key)
        var availableVariantViewModels: [String: VariantViewModel] = [:]
        intersectingKeys.forEach { aKey in
            let split = aKey.split(separator: ".")
            if split.count == 2 {
                let variantName = split[0], valueName = split[1]
                if var variantViewModels = availableVariantViewModels[String(variantName)] {
                    variantViewModels.addValueName(valueName: String(valueName))
                    availableVariantViewModels[String(variantName)] = variantViewModels
                } else {
                    availableVariantViewModels[String(variantName)] = VariantViewModel(name: String(variantName), valueNamesArray: [String(valueName)])
                }
            }
        }
        return availableVariantViewModels
    }
    
    static func skuID(setNamesToIntersect: [String], skuIdSetMap: SkuIdSetMap) -> Int64? {
        
        var currentSkuIdSet = Set<Int64>()
        for nextKey in setNamesToIntersect {
            if let skuIDsFound = skuIdSetMap[nextKey] {
                if currentSkuIdSet.isEmpty {
                    currentSkuIdSet = skuIDsFound
                    //Logger.debug("currentSkuIdSet Init: \(currentSkuIdSet)")
                } else {
                    currentSkuIdSet = currentSkuIdSet.intersection(skuIDsFound)
                    if currentSkuIdSet.count == 1 {
                        return currentSkuIdSet.first
                    }
                }
            }
        }
        
        return currentSkuIdSet.first
    }
    
    static func buildVariantViewModels(offer: Offer) -> [VariantViewModel] {
        var variantViewModels: [VariantViewModel] = []
        var variantNameToValueNameSetsMap: [String: Set<String>] = [:]
        guard let offerSkus = offer.skus else { return variantViewModels }
        
        offerSkus.forEach { offerSku in

            if let skuVariantValuesSet = offerSku.variantValues {
                for variantValue in skuVariantValuesSet {
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
