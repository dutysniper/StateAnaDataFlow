//
//  UserSettings.swift
//  StateAnaDataFlow
//
//  Created by Alexey Efimov on 14.06.2023.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var name = ""
    
    func validate() -> Bool {
        name.count > 2
    }
}
