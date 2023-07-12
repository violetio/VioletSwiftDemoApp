//
//  FigmaConstants.swift
//  Checkout
//
//  Created on 6/29/23
//

import SwiftUI
struct FigmaConstants {
    static let cornerRadius: CGFloat = 10
    enum NavBar {
        static let titleFontSize: CGFloat = 25
        static let titleFontWeight: Font.Weight = .bold
    }
    
    enum NavBarCartButton {
        static let itemCountFontSize: CGFloat = 17
        static let itemCountFontWeight: Font.Weight = .semibold
    }
    
    enum OfferCard {
        static let width: CGFloat = 340
        static let imageArea = CGSize(width: 340, height: 340)
        static let textArea = CGSize(width: 340, height: 101)
        static let bottomImagePadding: CGFloat = 12
        static let bottomTextPadding: CGFloat = 12
        
        static var cardHeight: CGFloat {
            return imageArea.height + bottomImagePadding + textArea.height + bottomTextPadding
        }
    }
    
    enum Colors {
        static var systemGrey1: Color { Color(red: 0.56, green: 0.56, blue: 0.58) }
    }
    
}
