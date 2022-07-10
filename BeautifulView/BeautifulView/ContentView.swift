//
//  ContentView.swift
//  BeautifulView
//
//  Created by Ярослав Котов on 09.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation = 90.0
    var body: some View {
        VStack{
            VStack{
                Text("First")
                Text("Second")
                    .offset(y:15)
                    .padding(.bottom, 20)
                Text("Third")
            }
            ZStack(alignment: .bottomTrailing){
                Image("gameboy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Game")
                    .padding(4)
                    .background(.green)
                    .foregroundColor(.black)
                    .offset(x: -200,y:-400)
                    
                Text("Gameboy")
                Circle()
                    .strokeBorder(Color.red, lineWidth: 5)
                    .padding(140)
                    .offset(x: 0, y: -110)
                Circle()
                    .stroke(Color.red, style: StrokeStyle(lineWidth: 5,dash: [10,1]))
                    .frame(width:200, height: 200)
            }
            Text("Hiiiįpßkë").padding()
                .shadow(color: .red, radius: 3, x: 10, y: 10)
                .scaleEffect(3)
                
            Slider(value: $rotation, in: 0...360, step: 1.0)
            
            Text("ROTATE me")
                .foregroundColor(.red)
                .font(.largeTitle)
                .rotationEffect(.degrees(rotation), anchor: .topLeading)
            
            Text("3D EFFECT")
                .font(.largeTitle)
                .rotation3DEffect(.degrees(rotation), axis: (x: 0, y:1, z: 1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
