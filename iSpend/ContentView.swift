//
//  ContentView.swift
//  iSpend
//
//  Created by ca5 on 08/12/25.
//

import SwiftUI


struct Sheet : View {
    @State private var counter = 1
    @State private var liss: [Int] = []
    @Environment(\.dismiss) var diss
    let name: String
    var body : some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(liss, id: \.self) {
                        num in
                        Text("ROW \(num)")
                    }
                    .onDelete(perform: delRo)
                }
                
                Button("ADDRO", role: .confirm){
                    addro()
                }.buttonStyle(.glassProminent)
                    .glassEffect(.regular.interactive())
                
                Button("DISMISS", role: .destructive){
                    diss()
                }.buttonStyle(.glassProminent)
                    .glassEffect(.regular.interactive())
            }.toolbar{
                
                        Button("First") {}
                      
                    EditButton()}
                    
                
                    
            
        }
       
    }
    func addro(){
        liss.append(counter)
        counter += 1
    }
    
    func delRo(at hi : IndexSet) {
        liss.remove(atOffsets: hi)
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


#Preview {
    Sheet(name: "Preview")
}
