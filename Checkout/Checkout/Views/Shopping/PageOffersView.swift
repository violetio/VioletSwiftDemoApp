//
//  SelectedOfferView.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import SwiftUI

struct PageOffersView: View {
    var offer_id: Int = 0
    let offerGridItems = Array(1...20).map { ShoppingOfferGridItem(name: "Item \($0)" ) }
    let layout = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(offerGridItems, id: \.self.name) { item in
                    VStack {
                        item.thumbnailImage
                            .frame(minWidth:100, minHeight: 50)
                            .colorInvert()
                        
                        Text(item.name).colorInvert()
//                        Text(item.price.description).colorInvert()
                        
                        
                    }
                    .background(Color.gray)
                    .border(.black).padding(10)
                }
            }
            .padding(.horizontal)
        }.navigationBarTitle("ULTRA", displayMode: .inline)

        
    }
}

struct PageOffersView_Previews: PreviewProvider {
    static var previews: some View {
        PageOffersView()
    }
}
