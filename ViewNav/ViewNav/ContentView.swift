//
//  ContentView.swift
//  ViewNav
//
//  Created by Ярослав Котов on 03.07.2022.
//

import SwiftUI

// NavigationLink / Sheet
struct DetailView : View {
    var body: some View {
        Text("This is detail view")
    }
}


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView()){
                    Text("Show detail view")
                } .navigationTitle("Navigation")
            }
        }
    }
}


// Работа с динамическим списком

struct Dog: Identifiable {
    var id = UUID()
    var name: String
}

struct DogRow: View {
    var dog: Dog
    
    var body: some View {
        Text(dog.name)
    }
}

struct DogView: View{
    var dog: Dog
    
    var body: some View{
        Text("Dog name \(dog.name)")
            .font(.largeTitle)
    }
}

struct ListNavMain : View {
    var body: some View {
        let first = Dog(name: "Pes")
        let dogs = [first]
        
        return NavigationView {
            List(dogs) { dog in
                NavigationLink(destination: DogView(dog: dog)){
                    DogRow(dog: dog)
                }
            }.navigationTitle("Choose a dog")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ContentView()
        ListNavMain()
    }
}
