//
//  DataStore.swift
//  Checkout
//
//  Created by Alan Morford on 4/23/23.
//

import VioletPublicClientAPI

class DataStore {
    
    //On App Launch, there will need to be a check for resuming the previous App Logged In,
    //For Demo purposes just return the DemoChannel desired
    func resumeLoggedAppAvailable() -> AppIDAndSecret? {
        return DemoAppIdAndSecret.byDemoChannel(.Alan)
    }
    
    func offer(_ id: Int64) -> Offer? {
        return nil
    }
}
