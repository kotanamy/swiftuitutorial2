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


struct ContentView2Modifiers: View {
    
    var body: some View {
        Text("ContentView2Modifiers")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
