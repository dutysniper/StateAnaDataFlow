//
//  RootView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var user = UserSettings()
    @StateObject private var dataManager = DataManager()
    var body: some View {
        Group {
            if dataManager.isLogin {
                LoginView()
                    .environmentObject(dataManager)
            } else {
                ContentView()
                    .environmentObject(dataManager)
            }
        }
        .environmentObject(user)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
