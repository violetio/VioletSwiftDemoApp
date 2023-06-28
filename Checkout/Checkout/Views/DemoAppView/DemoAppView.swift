//
//  DemoAppView.swift
//  Checkout
//
//  Created on 6/28/23
//

import SwiftUI

struct DemoAppView: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Demo App")
                        .font(.system(size: 25, weight: .bold))
                      .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "cart")
                }.padding(.horizontal)
            }
        }
    }
}

struct DemoAppView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppView()
    }
}
