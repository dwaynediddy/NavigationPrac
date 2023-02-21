//
//  VideoGamePlatformView.swift
//  NavigationPrac
//
//  Created by Dwayne on 21/2/2023.
//

import SwiftUI

struct VideoGamePlatformView: View {
    
    var platforms: [Platform] = [.init(name: "xbox", imageName: "xbox.logo", color: .green),
                                 .init(name: "playstation", imageName: "playstation.logo", color: .indigo),
                                 .init(name: "mobile", imageName: "iphone", color: .red)]
    
    var games: [Game] = [.init(name: "NBA 2k", rating: 91),
                         .init(name: "RuneScape", rating: 100),
                         .init(name: "CSGO", rating: 88),
                         .init(name: "RS3", rating: 17)]


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
                Section("Games") {
                    ForEach(games,id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle).bold()
                }
            }
            .navigationDestination(for: Game.self) { game in
                Text("\(game.name) - \(game.rating) / 100")
                    .font(.largeTitle).bold()
            }
        }
    }
}

struct VideoGamePlatformView_Previews: PreviewProvider {
    static var previews: some View {
        VideoGamePlatformView()
    }
}
