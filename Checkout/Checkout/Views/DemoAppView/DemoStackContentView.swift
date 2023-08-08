//
//  DemoStackContentView.swift
//  Checkout
//
//  Created on 7/31/23
//

import SwiftUI

struct DemoStackContentView: View {
    @Binding var store: AppStore
    
    var body: some View {
        NavigationStack
        {
            DemoAppView(store: $store)
            //.toolbarBackground(.white)
        }
    }
}

struct DemoStackContentView_Previews: PreviewProvider {
    static var previews: some View {
        DemoStackContentView(store: AppStore.mockAppStoreBinding)
    }
}