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
    let type: String = "Useless"
}

@Observable
class ExpenseArrayClass {
    var items : [Exp] = []
}
struct ContentView : View {
    @State private var expen = ExpenseArrayClass()
    @State private var isEmpty : Bool = true
    var body: some View {
        NavigationStack{
            List {
                ForEach(expen.items, id: \.id)
                {c in Text("\(c.name) \(c.type) \(c.price) rs.")}
                    .onDelete(perform: removeItems)
                    
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
                             let item = Exp(name: "test", price: 50)
                         withAnimation{
                             expen.items.append(item)
                             isEmpty = false
                         }
                     }.buttonStyle(.glassProminent).tint(.orange).glassEffect(.identity.interactive())
                     
                 }
             }
        }
    }
    
    func removeItems(at idx : IndexSet){
            expen.items.remove(atOffsets: idx)
    }
}

#Preview {
    ContentView()
}


