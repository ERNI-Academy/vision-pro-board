//
//  MainPanel.swift
//  vision-pro-board
//
//  Created by David Carmona on 13/9/23.
//

import SwiftUI

struct MainPanel: View {
    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0
    @State private var isStarting: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("MainImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 800)
                Text("Vision Pro Board")
                    .font(.system(size: 30, weight: .bold))
                Text(
                    "Your Health at a Glance: The Medical Information Dashboard")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .frame(width: 340)
                    .padding(.bottom, 10)
                
                Button("Enter") {
                    isStarting = true
                    withAnimation {
                        width = 200
                        height = geometry.size.height
                    }
                }
            }
            .onAppear {
                width = geometry.size.width
                height = geometry.size.height
            }
            .onChange (of: geometry.size.width != width || geometry.size.height != height) {
                if !isStarting { width = geometry.size.width }
                height = geometry.size.height
            }
            .padding()
            .frame(width: width, height: height)
            .glassBackgroundEffect()
        }
    }
}

#Preview {
    MainPanel()
}
