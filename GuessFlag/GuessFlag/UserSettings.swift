//
//  UserSettings.swift
//  GuessFlag
//
//  Created by Ярослав Котов on 03.07.2022.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var score = 0
}

struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
