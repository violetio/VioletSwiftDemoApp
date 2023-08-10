//
//  OfferVariantValuePicker.swift
//  Checkout
//
//  Created on 8/9/23
//

import SwiftUI

struct OfferVariantValuePicker_Menu: View {
    @State var variantViewModel: VariantViewModel
    @State var selectedValue: String
    var body: some View {
        
        VStack {
//            LabeledContent("Variant Name", value: variantViewModel.name)
//
//            ForEach(variantViewModel.variantValuesArray) { value in
//                Text(value.name)
//            }
            
            Menu {
                Picker(selection: $selectedValue) {
                    ForEach(variantViewModel.variantValuesArray) { value in
                        Text(value.name)
                            //.font(Font.custom("SF Pro Text", size: 17)).foregroundColor(.black)
                    }
                } label: { }

            } label: {
                Text("Label")
            }

//            Menu {
//                Picker("\(variantViewModel.name)", selection: $selectedValue) {
//                    ForEach(variantViewModel.variantValuesArray) { value in
//                        Text(value.name).font(Font.custom("SF Pro Text", size: 17)).foregroundColor(.black)
//                    }
//                }.font(Font.custom("SF Pro Text", size: 17))
//
//            } label: {
//                <#code#>
//            }
//            .onAppear {
//                variantViewModel.variantValuesArray.forEach {
//                    Logger.info($0.name)
//                }
//            }
        }

    }
}

struct OfferVariantValuePicker_Menu_Previews: PreviewProvider {
    static let mockOfferItem = PreviewMocks.Mock_DemoProductGridOfferItem_12555()
    static let mockVariant_1 = mockOfferItem.variantViewModels[0]
    static let mockVariant_DefaultValue = mockVariant_1.variantValuesArray[0]
    static var previews: some View {
        OfferVariantValuePicker(variantViewModel: mockVariant_1, selectedValue: mockVariant_DefaultValue.name)
    }
}
