//
//  ContentView.swift
//  iSpend
//
//  Created by ca5 on 08/12/25.
//

import SwiftUI


struct Sheet : View {
    var body : some View {
        Text("Secpnd sheet")
        Text("hiiiiiï")
    }
}

@Observable
class User {
    var name: String = "hii"
}

struct ContentView: View {
    @State private var showingSecondSheet = false
    @State var user1: User = User()
    var body: some View {
        VStack {
            Text("\(user1.name) bye")
            TextField("the name is: ",text: $user1.name)
            Button("SHOW SECOND SHEET"){
                showingSecondSheet.toggle()
            }
            .sheet(isPresented: $showingSecondSheet){
                Sheet()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
