//
//  WelcomePanel.swift
//  vision-pro-board
//
//  Created by David Carmona on 14/9/23.
//

import SwiftUI

struct WelcomePanel: View {
    @Binding var isStarted: Bool
    
    var body: some View {
        VStack {
            Image("MainImage")
                .resizable()
                .scaledToFit()
                .frame(width: 800)
                .padding(80)
            Text("Vision Pro Board")
                .font(.system(size: 30, weight: .bold))
            Text(
                "Your Health at a Glance: The Medical Information Dashboard")
                .multilineTextAlignment(.center)
                .font(.headline)
                .frame(width: 340)
                .padding(.bottom, 10)
            
            Toggle(isOn: $isStarted) {
                Label("Enter", systemImage: "cross")
            }
            .toggleStyle(.button)
        }
    }
}

#Preview {
    WelcomePanel(isStarted: .constant(false))
        .environmentObject(AppStore())
}
