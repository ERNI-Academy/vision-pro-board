//
//  boardApp.swift
//  board
//
//  Created by David Carmona on 7/9/23.
//

import SwiftUI

@main
struct boardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.plain)

        ImmersiveSpace(id: "ImmersiveSpace") {
            MetallicBall()
        }
    }
}
