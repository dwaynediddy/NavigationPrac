//
//  ContentView.swift
//  NavigationPrac
//
//  Created by Dwayne on 20/2/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [String]()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink ("title", value: "abc")
                
                Button("navigate to xyz ") {
                    path.append("new path xyz")
                }
            }
            .navigationDestination(for: String.self) { string in
                Text(string)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
