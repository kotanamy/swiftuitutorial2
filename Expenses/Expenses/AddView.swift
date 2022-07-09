//
//  AddView.swift
//  Expenses
//
//  Created by Ярослав Котов on 09.07.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses : Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Bussines", "Personal"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(self.types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }.navigationBarTitle("Add")
                .navigationBarItems(trailing: Button("Save"){
                    if let actualAmount = Int(self.amount){
                        let item = ExpenseItem(name: self.name, type: self.type, amoumt: actualAmount)
                        self.expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        //AddView(expenses: Expenses)
        Text("aaa")
    }
}
