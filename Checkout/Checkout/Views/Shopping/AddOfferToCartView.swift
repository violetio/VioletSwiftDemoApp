//
//  AddOfferToCartView.swift
//  Checkout
//
//  Created by Alan Morford on 4/19/23.
//

import SwiftUI

struct AddOfferToCartView: View {
    
    let shoppingOfferGridItem: ShoppingOfferGridItem
    
    init(shoppingOfferGridItem: ShoppingOfferGridItem) {
        self.shoppingOfferGridItem = shoppingOfferGridItem
    }
    
    var body: some View {
        Form {
            Text("Add Offer To Cart")
            
            if let thumbURL =  shoppingOfferGridItem.firstAlbumMediaImageURL {
                AsyncImage(url: thumbURL) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        Color.purple
                    }
                    
                }
            } else {
                shoppingOfferGridItem.thumbnailImage
                    .frame(minWidth:100, minHeight: 50)
                    .colorInvert()
            }
        }.border(.black).padding(10)
    }
}

struct AddOfferToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddOfferToCartView(shoppingOfferGridItem: PreviewMocks.Mock_ShoppingOfferGridItem())
    }
}
