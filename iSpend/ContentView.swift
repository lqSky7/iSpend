//
//  ContentView.swift
//  iSpend
//
//  Created by ca5 on 08/12/25.
//

import SwiftUI

@Observable
class User {
    var name: String = "hii"
}

struct ContentView: View {
    @State var user1: User = User()
    var body: some View {
        VStack {
            Text("\(user1.name) bye")
            TextField("the name is: ",text: $user1.name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
