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
    
    func buttonAction() {
        Logger.info("Button Action")
    }
    
    var productDetailsView: some View {
        VStack {
            Text(shoppingOfferGridItem.name).padding(10)
                .foregroundColor(Color.black)
            Text(shoppingOfferGridItem.priceText).padding(10)
                .foregroundColor(Color.black)
                
        }.padding(30).background(Color(white: 0.8))
    }
    var body: some View {
        VStack {
            
            Group {
                if let thumbURL =  shoppingOfferGridItem.firstAlbumMediaImageURL {
                    AsyncImage(url: thumbURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable().scaledToFit()
                                .border(.black)
                            
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
                
                productDetailsView

            }.padding([.leading, .trailing], 40)
            
            Button {
                buttonAction()
            } label: {
                Label("Add To Cart", systemImage: "cart")
            }
                .buttonStyle(.borderedProminent)
                
    
        }.border(.black)
    }
}

struct AddOfferToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddOfferToCartView(shoppingOfferGridItem: PreviewMocks.Mock_ShoppingOfferGridItem())
    }
}
