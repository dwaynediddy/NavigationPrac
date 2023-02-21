//
//  VideoGamePlatformModel.swift
//  NavigationPrac
//
//  Created by Dwayne on 21/2/2023.
//

import Foundation
import SwiftUI

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
let name: String
let rating: Int
}
