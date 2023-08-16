//
//  CartBagSection.swift
//  Checkout
//
//  Created on 8/16/23
//

import SwiftUI

struct CartBagSection: View {
    var body: some View {
        Section() {
            Text("Merchant Name")
            Text("Item 1")
            Text("Item 2")
            Text("Total")
        }
    }
}

struct CartBagSection_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CartBagSection()
        }
    }
}
