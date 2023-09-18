//
//  NavBarRestartButton.swift
//  Checkout
//
//  Created on 9/18/23
//

import SwiftUI

struct NavBarRestartButton: View {
    @Binding var store: AppStore
    @StateObject var router: Router
    
    var body: some View {
        Button() {
            Logger.debug("Restart")
            store.restart()
            
        } label: {
                HStack(spacing: 10) {
                    Image(systemName: "restart.circle")
                }.padding(.horizontal, 20)
                    .padding(.vertical, 13)
                    .cornerRadius(FigmaConstants.cornerRadius)
        }
    }
}

struct NavBarRestartButton_Previews: PreviewProvider {
    static var previews: some View {
        NavBarRestartButton(store: AppStore.mockAppStoreBinding,
                            router: Router())
    }
}
