//
//  QuantityPicker.swift
//  Checkout
//
//  Created on 8/18/23
//

import SwiftUI

struct QuantityPicker: View {
    
    @State var quatitySelected: Int = 0
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Picker(selection: $quatitySelected) {
                Text("QTY: 0").font(.system(size: 12, weight: .semibold)).tag(0).foregroundColor(.black)
                Text("QTY: 1").font(.system(size: 12, weight: .semibold)).tag(1).foregroundColor(.black)
                
            } label: {}
            
        }.frame(width: 105, height: 34)
    }
}

struct QuantityPicker_Previews: PreviewProvider {
    static var previews: some View {
        QuantityPicker()
    }
}
