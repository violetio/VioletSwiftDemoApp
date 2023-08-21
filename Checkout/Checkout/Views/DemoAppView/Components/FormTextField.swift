//
//  FormTextField.swift
//  Checkout
//
//  Created on 8/21/23
//

import SwiftUI

struct FormTextField: View {
    //init(_ titleKey: LocalizedStringKey, text: Binding<String>
    var titleKey: LocalizedStringKey
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField(titleKey,
                      text: $text)
            .padding()
            .font(Font.custom("SF Pro Text", size: 12))
        }.frame(width: 340, height: 44)
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(titleKey: "Label", text: .constant(""))
    }
}
