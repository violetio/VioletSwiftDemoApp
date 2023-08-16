//
//  NavBarCartButton.swift
//  Checkout
//
//  Created on 8/11/23
//

import SwiftUI

struct NavBarCartButton: View {
    var action: () -> Void
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: "cart.fill")
                Text("\(cartViewState.skuCount)")
                    .font(.system(size: FigmaConstants.NavBarCartButton.itemCountFontSize,
                                  weight: FigmaConstants.NavBarCartButton.itemCountFontWeight))
            }.padding(.horizontal, 20)
                .padding(.vertical, 13)
                .cornerRadius(FigmaConstants.cornerRadius)
        }
    }
}

struct NavBarCartButton_Previews: PreviewProvider {
    static var previews: some View {
        NavBarCartButton(action: {}, cartViewState: CartViewState(skuCount: 1))
    }
}
