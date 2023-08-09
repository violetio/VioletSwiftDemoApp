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


struct VariantViewModel {
    let variant: Variant
    
    init(variant: Variant) {
        self.variant = variant
    }
}
