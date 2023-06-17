//
//  dataManager.swift
//  StateAnaDataFlow
//
//  Created by Константин Натаров on 17.06.2023.
//

import SwiftUI

final class DataManager: ObservableObject {
    @AppStorage("userName") var  userName = ""
    @AppStorage("isLogin") var isLogin = false
    
    func add(user: String) {
        userName = user
        isLogin.toggle()
    }
}
