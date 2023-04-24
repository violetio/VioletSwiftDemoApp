//
//  AddOfferToCartView.swift
//  Checkout
//
//  Created by Alan Morford on 4/19/23.
//

import SwiftUI

struct AddOfferToCartView: View {
    
    @Binding var offerSelections: OfferSelections
    @Binding var shoppingOfferGridItem: ShoppingOfferGridItem
    

    func buttonAction() {
        offerSelections.insert(shoppingOfferGridItem.offer_id)
        Logger.info("offerSelections: \(offerSelections.description)")
    }
    
    var productDetailsView: some View {
        VStack {
            Text(shoppingOfferGridItem.name)
                .font(.title)
                .padding(10)
                .foregroundColor(Color.black)
            Text(shoppingOfferGridItem.intPrice.priceText())
                .font(.title2)
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color.white).cornerRadius(3)
                
        }.padding(30)
            .background(Color(white: 0.8))
            .cornerRadius(9)
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
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent).padding()
                
                
    
        }.withBlackBorder()
    }
}

struct AddOfferToCartView_Previews: PreviewProvider {
    static var previews: some View {
        AddOfferToCartView(offerSelections: .constant(PreviewMocks.Mock_OfferSelectionsState()),
                           shoppingOfferGridItem: .constant(PreviewMocks.Mock_ShoppingOfferGridItem()))
    }
}
