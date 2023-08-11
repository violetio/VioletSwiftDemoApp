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

        Menu {
            Picker(selection: $selectedValue) {
                ForEach(variantViewModel.variantValuesArray) { value in
                    Text(value.name)
                }
            } label: {
            }.frame(width: 360, height: 50)
        } label: {
            LabeledContent(variantViewModel.name, value: selectedValue).padding(.horizontal)
                .frame(width: 340, height: 44)
                .foregroundColor(.black)
        }
        .background(Color.white)
        .cornerRadius(12)
        .padding(.vertical, 5)

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
