//
//  ContentView.swift
//  NavigationPrac
//
//  Created by Dwayne on 20/2/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [String]()
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
//        NavigationStack(path: $path) {
//            List {
//                NavigationLink ("title", value: "abc")
//                Button("navigate to xyz ") {
//                    path.append("new path xyz")
//                }
                ZStack {
                    VStack {
                        TabView(selection: $selectedTab) {
                            ForEach(Tab.allCases, id: \.rawValue) { tab in
                                HStack {
                                    Image(systemName: tab.rawValue)
                                    Text("\(tab.rawValue.capitalized)")
                                        .bold()
                                        .animation(nil, value:  selectedTab)
                                }
                                .tag(tab)
                            }
                        }
                    }
                    VStack {
                        Spacer()
                        CustomTabBar(selectedTab: $selectedTab)
                    }
                }
//            }
//            .navigationDestination(for: String.self) { string in
//                Text(string)
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
