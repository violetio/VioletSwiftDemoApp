//
//  DemoAppView.swift
//  Checkout
//
//  Created on 6/28/23
//

import SwiftUI

struct DemoAppView: View {
    @Binding var store: AppStore
    
    var body: some View {
        NavigationStack {
            DemoAppProductGrid(store: $store, offerSearchViewState: store.offerSearchViewState)
        }
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Text("Demo App")
                        .font(.system(size: FigmaConstants.NavBar.titleFontSize,
                                      weight: FigmaConstants.NavBar.titleFontWeight))
                      .foregroundColor(.black)
                    Spacer()

                }.padding(.all)
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavBarCartButton(action: {
                    print("Custom button tapped!")
                }, buttonText: "0")
            }
        }
    }
}

struct NavBarCartButton: View {
    var action: () -> Void
    var buttonText: String
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: "cart.fill")
                Text(buttonText)
                    .font(.system(size: FigmaConstants.NavBarCartButton.itemCountFontSize,
                                  weight: FigmaConstants.NavBarCartButton.itemCountFontWeight))
            }.padding(.horizontal, 20)
                .padding(.vertical, 13)
                .cornerRadius(FigmaConstants.cornerRadius)
        }
    }
}


struct DemoAppView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppView(store: AppStore.mockAppStoreBinding)
    }
}
