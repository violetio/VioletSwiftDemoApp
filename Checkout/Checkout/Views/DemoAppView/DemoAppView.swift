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
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Text("Demo App")
                        .font(.system(size: 25, weight: .bold))
                      .foregroundColor(.black)
                    Spacer()

                }.padding(.horizontal)
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavBarCartButton(action: {
                    // Add your button action here
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
                    .font(.system(size: 17, weight: .semibold))
            }.padding(.horizontal, 20)
                .padding(.vertical, 13)
                .cornerRadius(10)
                //.border(.black)
        }
    }
}


struct DemoAppView_Previews: PreviewProvider {
    static var previews: some View {
        DemoAppView()
    }
}
