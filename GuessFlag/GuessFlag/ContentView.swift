//
//  ContentView.swift
//  GuessFlag
//
//  Created by Ярослав Котов on 03.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["UK", "USA", "Bangladesh", "Germany", "Argentina", "Brazil", "Canada", "Greece", "Russia", "Sweden"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all) // Background
            
            VStack(spacing:50) {
            
            VStack {
                Text("Choose flag")
                    .foregroundColor(.white)
                    .font(.headline)
                Text(countries[correctAnswer])
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
                
                ForEach(0..<3) { number in
                    Button(action:{
                        self.flagTapped(number)
                        self.showingScore = true
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .frame(width: 250, height: 130)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                            .shadow(color: .black, radius: 1)
                    }
                }
                
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
        } .alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message: Text("Score: \(score)"), dismissButton: .default(Text("Next")){
                self.askQuestion()
            })
        }
    }
    
    func askQuestion(){
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Right"
            score+=1
        } else {
            scoreTitle = "No, correct: \(countries[number])"
            score-=1
        }
    }
}



struct CustomText: View {
    var name: String
    
    var body: some View {
        Text(name)
            .customM()
        
    }
}

extension View {
    func customM() -> some View {
        self.modifier(CustomModifier())
    }
}

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(.red)
            .background(.black)
    }
}


struct ContentView2Modifiers: View {
    
    @State private var useGreenText = false
    
    var body: some View {
        
        VStack{
            Button("Hello green"){
                self.useGreenText.toggle()
            }.foregroundColor(useGreenText ? .green : .black)
            
            
            // Вариант 1
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.red)
                .background(.black)
            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.red)
                .background(.black)
            
            //Вариант 2 (вынесли в структуру выше)
            CustomText(name: "First")
            CustomText(name: "Second")
            
        }
        
    }
}

///_________________________///

// @State - property wrapper
// служит для того чтобы делиться данными внутри одного View

// @ObservedObject
// @EnviromentObject - можно делиться данными для всех View (типа static для всех)
// Нужны для связи нескольких view

// @Published - для свойств класса

class User : ObservableObject{
    @Published var firstName = "Ivan"
    @Published var lastName = "Petrov"
}


struct ContentViewObservedObjectPublishedEnviromentObject: View {
    
    @ObservedObject private var user = User() // User должен быть подписан на ObservableObject
    
    @ObservedObject var settings = UserSettings()
    
    var body: some View {
        VStack{
            Text("\(user.firstName) and \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Inc")
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ContentView()
        // ContentView2Modifiers()
        ContentViewObservedObjectPublishedEnviromentObject()
    }
}
