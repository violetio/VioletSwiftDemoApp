//
//  FormTextField.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI

typealias textFieldValidationFunc = (String) -> Bool

struct FormTextField: View {
    
    var titleKey: String
    @Binding var text: String
    var autoCapStyle: UITextAutocapitalizationType
    
    var body: some View {
        HStack {
            TextField(titleKey,
                      text: $text)
            .autocapitalization(autoCapStyle)
            .padding()
            .font(Font.custom("SF Pro Text", size: 12))
            
        }.frame(width: 340, height: 44)
            .background(Color.white)
            .cornerRadius(10)
    }
    
    init(_ titleKey: String,
         text: Binding<String>,
         autoCapStyle: UITextAutocapitalizationType = .none) {
        self.titleKey = titleKey
        self._text = text
        self.autoCapStyle = autoCapStyle
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField("Label", text: .constant(""))
    }
}
