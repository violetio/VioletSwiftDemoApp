//
//  SelectedOfferView.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import SwiftUI

struct PageOffersView: View {
    var offer_id: Int = 0
    let numbers = Array(1...20).map { "Item \($0)"}
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(numbers, id: \.self) { item in
                    Text(item)
                }
            }
            .padding(.horizontal)
        }

        
    }
}

struct PageOffersView_Previews: PreviewProvider {
    static var previews: some View {
        PageOffersView()
    }
}
