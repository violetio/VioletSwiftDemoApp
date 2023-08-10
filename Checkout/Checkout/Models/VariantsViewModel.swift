//
//  VariantsViewModel.swift
//  Checkout
//
//  Created on 8/9/23
//

import Violet

/*
 Pseudo code
 
 variantsMemo(offer: Offer?) => [Variant]?
 
 variantValuesMemo(variants: [Variant]?) => [string: [VariantValue] ]
 
 skusPerVariantCombination(*variantValuesMemo*) -> 
 */
class VariantsViewModel {
    let offer: Offer
    let variants: Set<Variant>
    
    init(offer: Offer) {
        self.offer = offer
        self.variants = offer.variants ?? Set()
    }
    
    func getArray() {
        let filtered = self.variants.filter { aVariant in
            if let variantValues = aVariant.values,
               variantValues.count > 0 {
                return true
            }
            return false
        }
    }
}


struct VariantViewModel: Equatable, Identifiable {
    var id: String { name }
    
    let variant: Variant
    let name: String
    let variantValuesArray: [VariantValueViewModel]
    
    init?(variant: Variant) {
        guard let variantName = variant.name else { return nil }
        
        guard let valuesSet = variant.values else { return nil }
        
        self.variantValuesArray = valuesSet.compactMap { VariantValueViewModel($0) }
        self.name = variantName
        self.variant = variant
    }
}

struct VariantValueViewModel: Equatable, Identifiable {
    var id: String { name }
    
    let variantValue: VariantValue
    let name: String
    let skuId: [Int64]
    init?(_ variantValue: VariantValue) {
        guard let aName = variantValue.name else { return nil }
        guard let aSkuIdSet = variantValue.skuIds else { return nil }
        
        self.skuId = Array(aSkuIdSet)
        self.name = aName
        self.variantValue = variantValue
    }
}
