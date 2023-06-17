//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var user: UserSettings
    @EnvironmentObject private var dataManager: DataManager
    @FocusState var isActive: Bool
    
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
                .onTapGesture {
                    isActive = false
                }
            VStack {
                HStack {
                    TextField("Enter your name...", text: $user.name)
                        .multilineTextAlignment(.center)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isActive = false
                                }
                            }
                        }
                        .autocorrectionDisabled()
                        .focused($isActive)
                    Text("\(user.name.count)")
                        .foregroundColor(user.validate() ? .green : .red)
                }
                Button(action: login) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                    .disabled(!user.validate())
                }
            }
            
            .padding()
        }
    }
    
    private func login() {
        if user.validate() {
            dataManager.add(user: user.name)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
