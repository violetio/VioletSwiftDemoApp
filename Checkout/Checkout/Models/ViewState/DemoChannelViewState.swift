//
//  DemoChannelViewState.swift
//  Checkout
//
//  Created on 5/5/23
//

import Foundation

class DemoChannelViewState: ObservableObject {

    @Published var demoChannelSelection: DemoChannels = DemoChannels.defaultDemoChannel

}
