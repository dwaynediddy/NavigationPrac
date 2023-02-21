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
    
    @State private var path = NavigationPath()


    var body: some View {
        NavigationStack(path: $path) {
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
                    VStack {
                            Label(platform.name, systemImage: platform.imageName)
                                .font(.largeTitle).bold()
                        List {
                            ForEach(games,id: \.name) { game in
                                NavigationLink(value: game) {
                                    Text(game.name)
                                }
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in
                VStack(spacing: 20) {
                    Text("\(game.name) - \(game.rating) / 100")
                        .font(.largeTitle).bold()
                    
                    Button("Recomended Game") {
                        path.append(games.randomElement()!)
                    }
                    
                    Button("Go to another Platform") {
                        path.append(platforms.randomElement()!)
                    }
                    
                    Button("Go Home") {
                        path.removeLast(path.count)
                    }
                }
            }
        }
    }
}

struct VideoGamePlatformView_Previews: PreviewProvider {
    static var previews: some View {
        VideoGamePlatformView()
    }
}
