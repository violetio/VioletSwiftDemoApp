//
//  DemoAppCartView.swift
//  Checkout
//
//  Created on 8/16/23
//

import SwiftUI

struct DemoAppCartView: View {
    @ObservedObject var cartViewState: CartViewState
    
    var body: some View {
        VStack {
        
                if cartViewState.cartEmpty {
                    Text("Your Cart is Empty")
                        .font(.system(size: 20, weight: .semibold))
                    Text("Continue browsing the Demo App.")
                        .font(.system(size: 14))
                        .frame(minHeight: 25)

                } else {
                    List {
                        CartBagSection()
                    }
                }
            
        }.navigationTitle("Shopping Cart")
    }
}

struct DemoAppCartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DemoAppCartView(cartViewState: CartViewState(skuCount: 1)).previewDisplayName("1 Sku")
            
            DemoAppCartView(cartViewState: CartViewState(skuCount: 0)).previewDisplayName("0 Skus")
        }
    }
}
