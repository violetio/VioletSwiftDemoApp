//
//  Router.swift
//  Checkout
//
//  Created on 8/28/23
//

import SwiftUI

enum NavigationKey: Hashable, Identifiable {
//    case offersGrid
    case offerPDP(DemoProductGridOfferItem)
    case cartView
    case addShippingAddress
    case selectShippingMethod
    case payForOrder
    
    var id: String {
        String(describing: self)
    }
}

class Router: ObservableObject {
    @Published var paths = NavigationPath()
    @Published var lastPath: NavigationKey? = nil
    func append(_ path: NavigationKey) {
        self.lastPath = path
        paths.append(path)
    }
}
