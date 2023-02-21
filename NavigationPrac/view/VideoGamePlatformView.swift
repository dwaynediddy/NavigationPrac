//
//  VideoGamePlatformView.swift
//  NavigationPrac
//
//  Created by Dwayne on 21/2/2023.
//

import SwiftUI

struct VideoGamePlatformView: View {
    
    var platforms: [Platform] = [.init(name: "xbox", imageName: "xbox.logo", color: .green),
                                 .init(name: "playstation", imageName: "playstation.logo", color: .blue),
                                 .init(name: "mobile", imageName: "iphone", color: .red)
    ]

    var body: some View {
        NavigationStack {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
        }
    }
}

struct VideoGamePlatformView_Previews: PreviewProvider {
    static var previews: some View {
        VideoGamePlatformView()
    }
}
