//
//  ViewDataCoordinator.swift
//  Checkout
//
//  Created by Alan Morford on 4/23/23.
//

import SwiftUI

class ViewDataCoordinator: CustomStringConvertible {
    var description: String {
        return "Grid Item Count: \(gridDataSource.offerGridItems.count)"
    }
    
    func logDescription() {
        Logger.info("\(self)")
    }
    
    @State var offerSelections: OfferSelections
    @State var gridDataSource: OfferGridDataSource
    
    init(offerSelections: OfferSelections = OfferSelections(), gridDataSource: OfferGridDataSource = OfferGridDataSource()) {
        self.offerSelections = offerSelections
        self.gridDataSource = gridDataSource
    }
    
    static func mock() -> ViewDataCoordinator {
        return ViewDataCoordinator(offerSelections: PreviewMocks.Mock_OfferSelectionsState(),
                                   gridDataSource: PreviewMocks.MockOfferGridDataSource())
    }
    
}

class MockViewDataCoordinator: ViewDataCoordinator {
    
    init() {
        super.init(offerSelections: PreviewMocks.Mock_OfferSelectionsState(),
                   gridDataSource: PreviewMocks.MockOfferGridDataSource())
    }
}
