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
    @ObservedObject var channelLoginViewState: ChannelLoginViewState
    @ObservedObject var dataStore: DataStore = .shared
    var tab: Tab = .settings
    let demoChannelOptions: [DemoChannels] = DemoChannels.allCases
    @State var demoChannelSelection: DemoChannels = .defaultDemoChannel

    func demoAppCreds() -> AppCreds {
        return AppCreds.SandBoxTestCreds(demoChannelSelection)
    }

    func runLoginPost() {
//        dataStore.apiCallService.sendLoginPost(appCreds: demoAppCreds())
    }

    func doLogOut() {
        Logger.debug("Log Out")
//        dataStore.doLogOut()
    }

    func doRefresh() {
        Logger.debug("Refresh")
//        if let headers = dataStore.channelHeaders,
//           let refreshToken = dataStore.currentAuthToken?.refreshToken
//        {
////            dataStore.apiCallService.sendRefreshToken(appIDAndSecret: headers, refreshToken: refreshToken)
//        }
    }

    var channelIdentitySection: some View {
        Section {
            DemoChannelPickerView(demoChannelViewState: store.demoChannelViewState,
                                  store: $store)

        } header: {
            Text("Channel")
        }
    }

    var logInOutRefreshSection: some View {
        Section {
            if let channelHeaders = store.channelLoginViewState.channelHeaders {
                Button("Log Out") {
                    store.send(.logout)
                }

                Button("Refresh") {
                    store.send(.refreshAuthTokenRequest(channelHeaders))
                }
            } else {
                if store.useDemoLogin {
                    Button("Log In") {
                        store.send(.loginRequest(store.demoLoginInputs(store.demoChannelViewState.demoChannelSelection)))
                    }
                } else {
                    Text("Login Form Goes Here")
                }
            }

        } header: {
            Text("Log In/Out/Refresh")
        }
    }

    var authTokenSection: some View {
        Section {
            if let channelHeaders = store.channelLoginViewState.channelHeaders {
                HStack {
                    Text("AuthToken:").fontWeight(.semibold).padding([.trailing], 5)
                        .frame(minWidth: 90)
                    Text("\(channelHeaders.authToken)")
                        .monospaced()
                        .minimumScaleFactor(0.3)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 200, height: 80, alignment: .trailing)
                }
                HStack {
                    Text("Refresh:").fontWeight(.semibold).padding([.trailing], 5)
                        .frame(minWidth: 90)
                    Text("\(channelHeaders.refreshToken)")
                        .monospaced()
                        .minimumScaleFactor(0.3)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 200, height: 80, alignment: .trailing)
                }
            } else {
                Label("No AuthToken", systemImage: "key.viewfinder")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 320, minHeight: 80)
                // .background(Color.blue)
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
            case .LogInOutRefresh:
                logInOutRefreshSection
            }
        }
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView(store: AppStore.mockAppStoreBinding,
                        channelLoginViewState: ChannelLoginViewState())
    }
}
