//
//  ContentView.swift
//  UserDefaults
//
//  Created by Ярослав Котов on 03.07.2022.
//

// Лучше в нем хранить не больше 512кб, сохраняет медленно

import SwiftUI

struct User : Codable {
    var firstName: String
    var lastName: String
}

// JSON Encoder (Codable нужен)

struct ContentView: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @State private var user = User(firstName: "Petya", lastName: "Petin")
    
    var body: some View {
        VStack{
            Button("Tap count: \(tapCount)"){
                self.tapCount+=1
                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
            }.padding()
            
            Button("Save user"){
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(self.user){
                    UserDefaults.standard.set(data, forKey: "UserData")
                }
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
