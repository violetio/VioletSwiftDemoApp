//
//  SelectedOfferView.swift
//  Checkout
//
//  Created by Alan Morford on 3/9/23.
//

import SwiftUI
import VioletPublicClientAPI

struct OfferGridDataSource {
    let offerGridItems: [ShoppingOfferGridItem]
    
    init(pageOffers: PageOffer? = nil) {
        if let aPageOfOffers = pageOffers {
            offerGridItems = Self.shoppingOfferGridItems(pageOffers: aPageOfOffers)
        } else {
            offerGridItems = Array(1...20).map { ShoppingOfferGridItem(name: "Item \($0)" ) }
        }
    }
    
    static func shoppingOfferGridItems(pageOffers: PageOffer?) -> [ShoppingOfferGridItem] {
        return shoppingOfferGridItems(content: pageOffers?.content)
    }
    
    static func shoppingOfferGridItems(content: [Offer]?) -> [ShoppingOfferGridItem] {
        guard let contentOffers = content else {
            return []
        }
        return contentOffers.map(ShoppingOfferGridItem.fromOffer)
    }
}

struct PageOffersView: View {
    
    let gridDataSource: OfferGridDataSource
    
    init(gridDataSource: OfferGridDataSource = OfferGridDataSource()) {
        self.gridDataSource = gridDataSource
    }
    
    let layout = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(gridDataSource.offerGridItems, id: \.self.name) { item in
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
