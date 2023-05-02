//
//  OfferView.swift
//  Checkout
//
//  Created by Alan Morford on 3/29/23.
//

import SwiftUI
import VioletPublicClientAPI

struct OfferView: View {

    var offer: Offer
    
    public init(offer: Offer) {
        self.offer = offer
    }
    
    var body: some View {
        ZStack
        {
            VStack(spacing: 0) {
                //Divider().ignoresSafeArea()
                Form
                {
                    Section("Name"){
                        highlistsView
                    }
                    Section("Image") {
                        detailsView
                    }
                    Section("External URL") {
                        Text(offer.externalUrl ?? "")
                    }
                    Section("Offer Description") {
                        Text(offer.description ?? "")
                    }
                }
                .formStyle(.grouped)
            }
        }
        .toolbar {
            ToolbarTitleMenu {
                Button
                {
                }
                label: {
                    //Label("Placeholder", systemImage: "star")
                }
            }
        }
        .navigationTitle("Name of Offer")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
    }
    
    var highlistsView: some View {
        Text(offer.name)
    }
    
    var detailsView: some View {
        // AsyncImage(url: URL(string: offer.externalUrl ?? ""))
        AsyncImage(url: URL(string: "https://i1.t4s.cz/products/fv3743/adidas-continental-80-257423-fv3743.jpeg" ), scale:4)
    }
    
}

struct OfferView_Previews: PreviewProvider {
    struct Preview: View
    {
        let offer = Offer(id: 1, productId: "01001", name: "Offer Name", source: .shopify, merchantId: 42, minPrice: 0199)
        
        
        let offer12555 = MockOffers.load_Offer_12555()

        var body: some View {
            OfferView(offer: offer12555 ?? offer)
        }
    }

    static var previews: some View {
        NavigationStack {
            Preview()
        }
    }
}
