//
//  SettingsTabView.swift
//  Checkout
//
//  Created by Alan Morford on 4/24/23.
//

import SwiftUI

enum SettingsListSections: Int, CaseIterable, Identifiable {
    case ChannelIdentity
    case AuthToken
    
    var id: Int { rawValue }
}
struct SettingsTabView: View {
    var tab: Tab = .settings
    
    var channelIdentitySection: some View {
        Section {
            Text("Username, AppID")
            
        } header: {
            Text("Channel")
        }
    }
    
    var authTokenSection: some View {
        Section {
            Text("Checkout Steps")
            
        } header: {
            Text("AuthToken")
        }
    }
    
    var body: some View {
        
        List(SettingsListSections.allCases) { nextSection in
            switch nextSection {
            case .ChannelIdentity:
                channelIdentitySection
            case .AuthToken:
                authTokenSection
            }
            
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView()
    }
}
