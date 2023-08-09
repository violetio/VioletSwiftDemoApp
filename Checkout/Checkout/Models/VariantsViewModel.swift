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
    let variantValuesArray: [VariantValue]
    
    init?(variant: Variant) {
        guard let variantName = variant.name else { return nil }
        
        guard let valuesSet = variant.values else { return nil }
        
        self.variantValuesArray = Array(valuesSet)
        self.name = variantName
        self.variant = variant
    }
}
