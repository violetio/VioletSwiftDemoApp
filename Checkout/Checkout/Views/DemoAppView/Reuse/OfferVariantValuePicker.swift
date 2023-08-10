//
//  OfferVariantValuePicker.swift
//  Checkout
//
//  Created on 8/9/23
//

import SwiftUI

struct OfferVariantValuePicker: View {
    @State var variantViewModel: VariantViewModel
    @State var selectedValue: String
    var body: some View {

            List {
                Picker("\(variantViewModel.name)", selection: $selectedValue) {
                    ForEach(variantViewModel.variantValuesArray) { value in
                        HStack {
                            Text(value.name)
                        }.font(Font.custom("SF Pro Text", size: 17)).foregroundColor(.black)
                    }
                }.font(Font.custom("SF Pro Text", size: 17))
                
            }.withBlackBorder().onAppear {
                if let firstValueName = variantViewModel.variantValuesArray.first?.name {
                    selectedValue = firstValueName
                }

            }

    }
}

struct OfferVariantValuePicker_Previews: PreviewProvider {
    static let mockOfferItem = PreviewMocks.Mock_DemoProductGridOfferItem_12555()
    static let mockVariant_1 = mockOfferItem.variantViewModels[0]
    static let mockVariant_DefaultValue = mockVariant_1.variantValuesArray[0]
    static var previews: some View {
        OfferVariantValuePicker(variantViewModel: mockVariant_1, selectedValue: mockVariant_DefaultValue.name)
    }
}
