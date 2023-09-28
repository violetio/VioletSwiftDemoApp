//
//  RectangleCard.swift
//  Checkout
//
//  Created on 8/30/23
//

import SwiftUI

struct RectangleCard: View {
    var textLine1: String
    var textLine2: String
    
    var body: some View {
        Text("Hacking with Swift")
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 4)
            )
//        RoundedRectangle(cornerRadius: 12).stroke(Color.blue).overlay(alignment: .leading) {
//            VStack(alignment: .leading) {
//                Text(textLine1)
//                Text(textLine2)
//            }.padding()
//        }.frame(width: 340, height: 90, alignment: .leading)
        
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RectangleCard(textLine1:  "Ground",
                          textLine2: "$5.00 USD").background(Color.white)
        }.withScrollViewBackgroundColor()
    }
}
