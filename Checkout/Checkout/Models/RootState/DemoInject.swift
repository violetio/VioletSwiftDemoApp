//
//  DemoInject.swift
//  Checkout
//
//  Created on 5/9/23
//

import Foundation

class DemoInject {
    static func DemoChannelLoginViewState() -> ChannelLoginViewState {
        return ChannelLoginViewState(appIDandSecret: DemoAppIdAndSecret.byDemoChannel(.defaultDemoChannel))
    }
}
