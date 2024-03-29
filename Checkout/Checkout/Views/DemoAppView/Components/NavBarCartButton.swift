//
//  NavBarCartButton.swift
//  Checkout
//
//  Created on 8/11/23
//

import SwiftUI

struct NavBarCartButton: View {
    @Binding var store: AppStore
    @ObservedObject var cartViewState: CartViewState
    @StateObject var router: Router
    @State var ignoreNav = false
    var body: some View {
        Button() {
            Logger.debug("ignoreNav \(ignoreNav)")
            if !ignoreNav {
                router.append(NavigationKey.cartView)

            }
        } label: {
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
        NavBarCartButton(store: AppStore.mockAppStoreBinding,
                         cartViewState: CartViewState(),
                         router: Router())
    }
}
