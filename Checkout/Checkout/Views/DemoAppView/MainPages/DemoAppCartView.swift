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
        List {
            Section() {
                Text("Merchant Name")
                Text("Item 1")
                Text("Item 2")
                Text("Total")
            }
        }.navigationTitle("Shopping Cart \(cartViewState.skuCount)")
    }
}

struct DemoAppCartView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppCartView(cartViewState: CartViewState(skuCount: 1))
    }
}
