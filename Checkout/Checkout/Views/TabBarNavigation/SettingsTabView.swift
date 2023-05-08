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
    case LogInOutRefresh
    
    var id: Int { rawValue }
}
struct SettingsTabView: View {
    
    @Binding var store: AppStore
    @ObservedObject var dataStore: DataStore = DataStore.shared
    var tab: Tab = .settings
    let demoChannelOptions: [DemoChannels] = DemoChannels.allCases
    @State var demoChannelSelection: DemoChannels = DemoChannels.defaultDemoChannel

    func demoAppCreds() -> AppCreds {
        return AppCreds.SandBoxTestCreds(demoChannelSelection)
    }
    func runLoginPost() {
        dataStore.apiCallService.sendLoginPost(appCreds: demoAppCreds())
    }
    
    func doLogOut() {
        Logger.debug("Log Out")
        dataStore.doLogOut()
    }
    
    func doRefresh() {
        Logger.debug("Refresh")
        if let headers = dataStore.channelHeaders,
        let refreshToken = dataStore.currentAuthToken?.refreshToken {
            dataStore.apiCallService.sendRefreshToken(appIDAndSecret: headers,
                                                      refreshToken: refreshToken)
        }
    }
    var channelIdentitySection: some View {
        Section {
            Picker("Demo Channel Select", selection: $demoChannelSelection) {
                Text(DemoChannels.Alan.rawValue).tag(DemoChannels.Alan)
                Text(DemoChannels.Ishan.rawValue).tag(DemoChannels.Ishan)
            }
            .pickerStyle(.segmented)
            .onChange(of: demoChannelSelection) { newValue in
                Logger.info("Demo Channel Select: \(newValue)")
                dataStore.changeAppId(activeAppIDAndSecret: DemoAppIdAndSecret.byDemoChannel(newValue))
            }
            let appId: AppIDAndSecret = DemoAppIdAndSecret.byDemoChannel(demoChannelSelection)
            let username: String = DemoUsernameAndPassword.byDemoChannel(demoChannelSelection).username
            Text("Username: \(username)")
            Text("AppId: \(String(appId.appID))")
            
        } header: {
            Text("Channel")
        }
    }
    
    var logInOutRefreshSection: some View {
        Section {
            if dataStore.currentAuthToken != nil {
                Button("Log Out") {
                    doLogOut()
                }
                
                Button("Refresh") {
                    doRefresh()
                }
            } else {
                Button("Log In") {
                    runLoginPost()
                }
            }
            
            
            
        } header: {
            Text("Log In/Out/Refresh")
        }
    }
//    var authTokenSection: some View {
//
//        Section {
//            if let loadedChannelStore = dataStore.loadedChannelStore {
//                Text("Loaded Channel Store")
//                if let foundCachedLoginResponse = loadedChannelStore.cachedLoginResponse.cachedEntity {
//                    Text("Found Cached LoginResponse")
//                } else {
//                    Text("NO Cached LoginResponse")
//                    Button("Login Post") {
//                        runLoginPost()
//                    }
//                }
//            } else {
//                Text("No Channel Store Loaded")
//            }
//
//            if let currentAuthToken = dataStore.currentAuthToken {
//                Text("Token: \(currentAuthToken.authToken)")
//                Text("RefreshToken: \(currentAuthToken.refreshToken)")
//            } else {
//                Text("No AuthToken")
//            }
//
//
//        } header: {
//            Text("AuthToken")
//        }
//    }
    var authTokenSection: some View {
        CurrentAuthTokenView(currentAuthToken: $dataStore.currentAuthToken)
    }

    var body: some View {
        
        List(SettingsListSections.allCases) { nextSection in
            switch nextSection {
            case .ChannelIdentity:
                channelIdentitySection
            case .AuthToken:
                authTokenSection
            case .LogInOutRefresh:
                logInOutRefreshSection
            }
            
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView(store: AppStore.mockAppStoreBinding)
    }
}
