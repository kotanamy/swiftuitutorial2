//
//  ContentView.swift
//  TipCalc
//
//  Created by Ярослав Котов on 03.07.2022.
//

import SwiftUI

// Калькулятор чаевых
struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
    
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("Tips?")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Tips calc", displayMode: .inline)
        }
    }
}

// Alert tutorial and actionSheets
struct ContentView2Alert: View {
    
    @State private var showingAlert = false
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    
    @State private var sheet = false
    
    var body: some View {
        VStack{
            Button("Show Alert") {
                self.showingAlert = true
            }.alert(isPresented: $showingAlert){
                Alert(title: Text("Hello"), message: Text("detail"), dismissButton: .default(Text("OK")))
            }.padding()
            
            HStack{
                Button("Show1"){
                    self.showingAlert1 = true
                }.alert(isPresented: $showingAlert1){
                    Alert(title: Text("showingAlert1"), message: Text("showingAlert1"), dismissButton: .cancel())
                }
                
                Button("Show2"){
                    self.showingAlert2 = true
                }.alert(isPresented: $showingAlert2){
                    Alert(title: Text("showingAlert2"), message: Text("showingAlert2"), dismissButton: .cancel())
                }
            }
            
            // Action Sheets
            Button(action: {
                self.sheet = true
            }) {
                Text("Show Action Sheets")
            }.actionSheet(isPresented: $sheet){
                ActionSheet(title: Text("Sheet!!!"), message: Text("Only 1 choose"), buttons: [.default(Text("Dissmiss AS")), .cancel(), .destructive(Text("Destructive"))])
            }.padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // ContentView()
        ContentView2Alert()
    }
}
