//
//  ContentView.swift
//  iSpend
//
//  Created by ca5 on 08/12/25.
//

import SwiftUI

struct Exp : Identifiable{
    let id = UUID()
    let name: String
    let price: Int
    let type: String
}

@Observable
class ExpenseArrayClass {
    var items : [Exp] = []
}
struct ContentView : View {
    @State private var expen = ExpenseArrayClass()
    @State var isEmpty : Bool = true
    @State private var showingAddExpenseSheet : Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(expen.items, id: \.id)
                {c in Text("\(c.name) \(c.type) \(c.price) rs.")}
                    .onDelete(perform: removeItems)
                    
            }
            
            VStack{
                if(isEmpty){
                    Text("Tap the Plus icon to start")
                        .fontDesign(.rounded)
                        .fontWeight(.thin)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                
            }.navigationTitle("iSpend")
             .navigationBarTitleDisplayMode(.automatic)
             .toolbar{
                 ToolbarItem {
                         if(!isEmpty){
                             EditButton().glassEffect(.identity.interactive())
                         }
                     
                 }
                 ToolbarItemGroup(placement: .bottomBar){
                     Spacer()
                     Button("Add item", systemImage: "plus", role: .confirm){
                         
                         withAnimation{
                             showingAddExpenseSheet = true
                         }
                     }.buttonStyle(.glassProminent).tint(.orange).glassEffect(.identity.interactive())
                     
                 }
             }
        }.sheet(isPresented: $showingAddExpenseSheet){
            
            AddView(isEmpty: $isEmpty,expenArray: expen) .presentationDetents([.height(600)])
        }
    }
    
    func removeItems(at idx : IndexSet){
            expen.items.remove(atOffsets: idx)
    }
}

#Preview {
    ContentView()
}


