//
//  SheetNavView.swift
//  ViewNav
//
//  Created by Ярослав Котов on 03.07.2022.
//

import SwiftUI

struct DetailViewSheet: View {
    
    // Чтобы создать кнопку для выхода обратно (чтобы не смахивать вних вьюху)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Detail")
            Button("Back"){
                self.presentationMode.wrappedValue.dismiss()
            }
            
        }
    }
}


// Всплывающее окошечко

struct SheetNavView: View {
    
    @State private var showingDetail = false
    
    var body: some View {
        Button(action:{
            self.showingDetail.toggle()
        }) {
            Text("Show detail")
        }.sheet(isPresented:$showingDetail){
            DetailViewSheet()
        }
    }
}

struct SheetNavView_Previews: PreviewProvider {
    static var previews: some View {
        SheetNavView()
    }
}
