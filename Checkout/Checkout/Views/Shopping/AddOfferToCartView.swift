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
        Text("Add Offer To Cart")
    }
}

struct AddOfferToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddOfferToCartView(shoppingOfferGridItem: ShoppingOfferGridItem.mock_Preview())
    }
}
