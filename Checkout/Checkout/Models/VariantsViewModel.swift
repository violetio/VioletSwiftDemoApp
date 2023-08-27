//
//  VariantsViewModel.swift
//  Checkout
//
//  Created on 8/9/23
//

import Violet

typealias SkuIdSetMap = [String: Set<Int64>]
/*
 Pseudo code
 
 variantsMemo(offer: Offer?) => [Variant]?
 
 variantValuesMemo(variants: [Variant]?) => [string: [VariantValue] ]
 
 skusPerVariantCombination(*variantValuesMemo*) -> 
 */
class VariantsViewModel {
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


struct VariantViewModel: Equatable, Identifiable {
    var id: String { name }
    
    let name: String
    var variantValuesArray: [VariantValueViewModel]
    
    init?(variant: Variant) {
        guard let variantName = variant.name else { return nil }
        
        guard let valuesSet = variant.values else { return nil }
        
        self.variantValuesArray = valuesSet.compactMap { VariantValueViewModel($0) }
        self.name = variantName
    }
    
    init(name: String, valueNamesArray: [String]) {
        self.name = name
        self.variantValuesArray = valueNamesArray.map { VariantValueViewModel(name: $0)}
    }
    
    init(name: String, valueNamesSet: Set<String>) {
        self.name = name
        self.variantValuesArray = valueNamesSet.map { VariantValueViewModel(name: $0)}
    }
    
    mutating func addValueName(valueName: String) {
        variantValuesArray.append(VariantValueViewModel(name: valueName))
    }
}

struct VariantValueViewModel: Equatable, Identifiable {
    var id: String { name }
    
    let name: String
    init?(_ variantValue: VariantValue) {
        guard let aName = variantValue.name else { return nil }
        
        self.name = aName
    }
    
    init(name: String) {
        self.name = name
    }
}
