//
//  TabContentView.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI

struct CartTabView: View {
    
    @Binding var offerItemSelections: OfferItemSelections
    
    var tab: Tab = .cart
    
    enum CartListSections: Int, CaseIterable, Identifiable {
        case OfferItems
        case Checkout
        
        var id: Int { rawValue }
    }
    
    var cartItemsSections: some View {
        Section {
            ForEach(offerItemSelections.offerItems) { offerItem in
                OfferGridTile(offerItem: .constant(offerItem))
            }
        } header: {
            Text("Cart Items")
        }
    }
    
    var checkoutSection: some View {
        Section {
            Text("Checkout Steps")
            
        } header: {
            Text("Checkout")
        }
    }
    var body: some View {
        List(CartListSections.allCases) { nextSection in
            switch nextSection {
            case .OfferItems:
                cartItemsSections
            case .Checkout:
                checkoutSection
            }
            
        }
    }

}

struct CartTabView_Previews: PreviewProvider {
    static var previews: some View {
        CartTabView(offerItemSelections: .constant(PreviewMocks.Mock_OfferItemSelections()))
    }
}
