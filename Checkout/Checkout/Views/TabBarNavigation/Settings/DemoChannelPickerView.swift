//
//  DemoChannelPickerView.swift
//  Checkout
//
//  Created on 5/4/23
//

import SwiftUI

struct DemoChannelPickerView: View {

    let demoChannelOptions: [DemoChannels] = DemoChannels.allCases

    @ObservedObject var demoChannelViewState: DemoChannelViewState

    @Binding var store: AppStore

    var body: some View {
        Picker("Demo Channel Select", selection: $demoChannelViewState.demoChannelSelection) {
            Text(DemoChannels.Alan.rawValue).tag(DemoChannels.Alan)
            Text(DemoChannels.Ishan.rawValue).tag(DemoChannels.Ishan)
        }
        .pickerStyle(.segmented)
        .onChange(of: demoChannelViewState.demoChannelSelection) { newValue in
            Logger.info("Demo Channel Select: \(newValue)")
            store.send(.changeActiveAppID(DemoAppIdAndSecret.byDemoChannel(newValue)))
        }
        let appId: AppIDAndSecret = DemoAppIdAndSecret.byDemoChannel(demoChannelViewState.demoChannelSelection)
        let username: String = DemoUsernameAndPassword.byDemoChannel(demoChannelViewState.demoChannelSelection).username
        Text("Username: \(username)")
        Text("AppId: \(String(appId.appID))")
    }
}

struct DemoChannelPickerView_Previews: PreviewProvider {
    static var previews: some View {
        DemoChannelPickerView(demoChannelViewState: AppStore.mockAppStore.demoChannelViewState, store: AppStore.mockAppStoreBinding)
    }
}
