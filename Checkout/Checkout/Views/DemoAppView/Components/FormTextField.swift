//
//  FormTextField.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI

typealias textFieldValidationFunc = (String) -> Bool

struct FormTextField: View {
    //init(_ titleKey: LocalizedStringKey, text: Binding<String>
    var titleKey: String
    @Binding var text: String
    var validationFunc: textFieldValidationFunc?
    
    var body: some View {
        HStack {
            TextField(titleKey,
                      text: $text)
            .padding()
            .font(Font.custom("SF Pro Text", size: 12))
            .onChange(of: text) { newValue in
                if let valFunc = validationFunc {
                    let isValid = valFunc(newValue)
                    Logger.debug("TextFormField: Titled: \(titleKey) - Changed Value - \(newValue) isValid - \(isValid)")
                }
            }
        }.frame(width: 340, height: 44)
            .background(Color.white)
            .cornerRadius(10)
    }
    
    init(_ titleKey: String, text: Binding<String>, validationFunc: textFieldValidationFunc? = nil) {
        self.titleKey = titleKey
        self._text = text
        self.validationFunc = validationFunc
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField("Label", text: .constant(""))
    }
}
