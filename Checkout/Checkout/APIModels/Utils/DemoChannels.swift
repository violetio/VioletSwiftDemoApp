//
//  DemoChannels.swift
//  Checkout
//
//  Created on 4/23/23.
//

enum DemoChannels: String, CaseIterable, Identifiable, Equatable {
    case Ishan
    case Alan
    
    var id: Self { self }
    
    static let defaultDemoChannel: DemoChannels = .Alan
}
