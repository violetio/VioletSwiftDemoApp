//
//  QuantityPicker.swift
//  Checkout
//
//  Created on 8/18/23
//

import SwiftUI

struct QuantityPicker: View {
    
    @State var quatitySelected: Int = 1
    let pickRange = (1...10)
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Picker(selection: $quatitySelected) {
                ForEach(Array(pickRange), id: \.self) { pickValue in
                    Text("QTY: \(pickValue)").font(.system(size: 12, weight: .semibold)).tag(pickValue).foregroundColor(.black)
                }.foregroundColor(.black)
                
            } label: {}.frame(width: 95, height: 26)
                .scaleEffect(0.75)   
        }
    }
}

struct QuantityPicker_Previews: PreviewProvider {
    static var previews: some View {
        QuantityPicker()
    }
}
