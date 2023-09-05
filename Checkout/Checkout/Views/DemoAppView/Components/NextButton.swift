//
//  NextButton.swift
//  Checkout
//
//  Created on 9/4/23
//

import SwiftUI

struct NextButton: View {
    @Binding var nextEnabled: Bool
    
    var action: () -> Void
    
    public init(nextEnabled: Binding<Bool>, action: @escaping () -> Void = {}) {
        self._nextEnabled = nextEnabled
        self.action = action
    }
    var body: some View {
        Button {
            self.action()

        } label: {
            if nextEnabled {
                Text("Next")
                    .font(Font.custom("SF Pro Text", size: 17))
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(Color(red: 0, green: 0.48, blue: 1))
                    .cornerRadius(12)
            } else {
                Text("Next")
                    .font(Font.custom("SF Pro Text", size: 17))
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(Color(red: 0.47, green: 0.47, blue: 0.5).opacity(0.16))
                    .cornerRadius(12)
            }
        }
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton(nextEnabled: .constant(false))
    }
}
