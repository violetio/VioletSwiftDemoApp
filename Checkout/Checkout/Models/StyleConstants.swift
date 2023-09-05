//
//  StyleConstants.swift
//  Checkout
//
//  Created on 4/19/23.
//

import SwiftUI

struct StyleConstants {
    
    enum LargeButton {
        static let TB: CGFloat = 20
        static let LR: CGFloat = 50
        static let Insets = EdgeInsets(top: TB,
                                       
                                       leading: LR,
                                       
                                       bottom: TB,
                                       
                                       trailing: LR)
        static let CornerRadius: CGFloat = 9
    }
    
    struct OfferGridLayoutConstants {
        static let imageMaxWidth: CGFloat = 80
        static let imageMaxHeight: CGFloat = 80
        static let itemMaxWidth: CGFloat = 100
        static let itemMaxHeight: CGFloat = 120
        static let aspectRatio: CGSize = CGSize(width: 80, height: 80)
    }
    
}

struct BlackBorder: ViewModifier {
    func body(content: Content) -> some View {
        content.border(.black)
    }
}

extension View {
    func withBlackBorder() -> some View {
        modifier(BlackBorder())
    }
}
