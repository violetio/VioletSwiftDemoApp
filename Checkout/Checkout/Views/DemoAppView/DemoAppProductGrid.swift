//
//  DemoAppProductGrid.swift
//  Checkout
//
//  Created on 6/29/23
//

import SwiftUI

struct DemoAppProductGrid: View {
    @Binding var store: AppStore
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DemoAppProductGrid_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppProductGrid(store: AppStore.mockAppStoreBinding)
    }
}
