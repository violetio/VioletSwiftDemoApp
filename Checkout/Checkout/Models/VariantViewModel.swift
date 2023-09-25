//
//  VariantsViewModel.swift
//  Checkout
//
//  Created on 8/9/23
//

import Violet

struct VariantViewModel: Equatable, Identifiable {
    var id: String { name }
    
    let name: String
    var variantValuesArray: [VariantValueViewModel]
    var skuMapKeys: [String] {
        variantValuesArray.map { "\(name).\($0.name)" }
    }
    
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
