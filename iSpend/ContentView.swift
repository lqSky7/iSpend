//
//  ContentView.swift
//  iSpend
//
//  Created by ca5 on 08/12/25.
//

import SwiftUI


struct Sheet : View {
    @State private var counter = UserDefaults.standard.integer(forKey: "key1")
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
                    UserDefaults.standard.set(counter, forKey: "key1")
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

struct User : Encodable{
    var name: String
    var lastName: String
}

struct ContentView: View {
    @State private var showingSecondSheet = false
    @State var user1: User = User(name: "D", lastName: "S" )
    var body: some View {
        VStack {
            Text("\(user1.name) bye")
            TextField("the name is: ",text: $user1.lastName)
            
            Button("SAVE DETAILS", role: .confirm){
                
                let encoder : JSONEncoder = JSONEncoder()  // it is a type of itself...
                
                if let data = try? encoder.encode(user1) {
                    UserDefaults.standard.set(data, forKey: "KEY1")
                }
                
            }.buttonStyle(.glassProminent)
                .glassEffect(.regular.interactive())
                .tint(.black)
            
            
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
