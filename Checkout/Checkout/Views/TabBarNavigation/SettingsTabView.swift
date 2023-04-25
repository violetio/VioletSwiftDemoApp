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
    
    @ObservedObject var dataStore: DataStore = DataStore.shared
    var tab: Tab = .settings
    let demoChannelOptions: [DemoChannels] = DemoChannels.allCases
    @State var demoChannelSelection: DemoChannels = DemoChannels.defaultDemoChannel

    var channelIdentitySection: some View {
        Section {
            Picker("Demo Channel Select", selection: $demoChannelSelection) {
                Text(DemoChannels.Alan.rawValue).tag(DemoChannels.Alan)
                Text(DemoChannels.Ishan.rawValue).tag(DemoChannels.Ishan)
            }
            .pickerStyle(.segmented)
            .onChange(of: demoChannelSelection) { newValue in
                Logger.info("Demo Channel Select: \(newValue)")
                dataStore.changeAppId(DemoAppIdAndSecret.byDemoChannel(newValue).appID)
            }
            let appId: AppIDAndSecret = DemoAppIdAndSecret.byDemoChannel(demoChannelSelection)
            let username: String = DemoUsernameAndPassword.byDemoChannel(demoChannelSelection).username
            Text("Username: \(username)")
            Text("AppId: \(String(appId.appID))")
            
        } header: {
            Text("Channel")
        }
    }
    
    var authTokenSection: some View {
        Section {
            if let loadedChannelStore = dataStore.loadedChannelStore {
                Text("Loaded Channel Store")
            } else {
                Text("No Channel Store Loaded")
            }
            
            
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
