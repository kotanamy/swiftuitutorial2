//
//  ContentView.swift
//  AnimationTutor
//
//  Created by Ярослав Котов on 10.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scale: CGFloat = 1
    @State private var angle: Double = 0
    @State private var showingWelcome = false
    @State private var opacity = 1.0
    @State private var rotation = 0.0
    
    @State private var scaling : CGFloat = 1
    
    var body: some View {
        VStack{
        Button(action: {
            self.scale += 1
        }) {
            Text("Tap me")
                .scaleEffect(scale)
                    .animation(.easeOut)
        }
            
        Button(action: {
            self.angle += 45
        }) {
            Text("Tap me22")
                .padding()
                .rotationEffect(.degrees(angle))
                .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 3, initialVelocity: 5))
            
        }
            
            VStack{
                // Неявно выраженная анимация
                Toggle(isOn: $showingWelcome.animation(.spring())){
                    Text("Toggle label")
                }
                if showingWelcome {
                    Text("Hello")
                }
            }
            
            Button(action:{
                withAnimation (.linear(duration: 1)){
                    self.opacity -= 0.5
                }
            }) {
                Text("OPACITY")
                    .padding()
                    .opacity(opacity)
            }
            
            Rectangle()
                .fill(.green)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.easeInOut(duration: 3).delay(0.5))
                .onTapGesture {
                    self.rotation += 360
                }
            
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .scaleEffect(scaling)
                .onAppear{
                    let baseAnim = Animation.easeInOut(duration: 1)
                    let repeated = baseAnim.repeatForever(autoreverses: true)
                    return withAnimation(repeated){
                        self.scaling = 0.5
                    }
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
