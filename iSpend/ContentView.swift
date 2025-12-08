//
//  ContentView.swift
//  iSpend
//
//  Created by ca5 on 08/12/25.
//

import SwiftUI


struct Sheet : View {
    @Environment(\.dismiss) var diss
    let name: String
    var body : some View {
        

        Text("Secpnd sheet")
        Text("hiiiiiï \(name)")
        Button("DISMISS", role: .destructive){
            diss()
        }.buttonStyle(.glassProminent)
        .glassEffect(.regular.interactive())
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
                Sheet(name: "RAH")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
