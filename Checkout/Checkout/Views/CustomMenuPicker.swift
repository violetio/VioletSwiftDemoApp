//
//  CustomMenuPicker.swift
//  Checkout
//
//  Created on 8/9/23
//

import SwiftUI

struct CustomMenuPicker: View {
    @State var selectedNumber: Int = 0
        
    var body: some View {
        Menu {
                Picker(selection: $selectedNumber, label: EmptyView()) {
                    ForEach(0..<10) {
                        Text("\($0)")
                    }
                }.cornerRadius(12)
            } label: {
                customLabel.cornerRadius(12)
            }.cornerRadius(12)
    }
    
    var customLabel: some View {
        HStack {
            Text(String(selectedNumber))
            Spacer()
            Text("⌵")
                .offset(y: -4)
        }
        .foregroundColor(.black)
        .font(.title)
        .padding()
        .frame(height: 44)
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct CustomMenuPicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomMenuPicker().border(.black)
        }.background(FigmaConstants.Colors.scrollViewBackgroundColor)
    }
}
