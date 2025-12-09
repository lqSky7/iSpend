//
//  AddView.swift
//  iSpend
//
//  Created by ca5 on 09/12/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var price = 0
    @State private var type = "Useless"

    
    let types = ["Useful", "Useless"]
    
    var expenArray : ExpenseArrayClass
    
    var body: some View {
        NavigationStack{

            Form{
                TextField("Enter expense", text: $name)
                Picker("Pick your poison", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Enter the amount", value: $price, format: .currency(code: "inr" )).keyboardType(.numberPad)
            }.navigationTitle("Add new expense")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button(role: .confirm) {
                            if(price != 0){
                                appendToExpenArray()
                                dismiss()
                            }
                        } label: {
                            Label("Done", image: "tick")
                        }

                    }
                }
        }
    }
    func appendToExpenArray(){
        let newObjectOfExp = Exp(name: name, price: price, type: type)
        expenArray.items.append(newObjectOfExp)
    }
    
}

#Preview {
    AddView(expenArray: ExpenseArrayClass())
}
