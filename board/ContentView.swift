//
//  ContentView.swift
//  board
//
//  Created by David Carmona on 7/9/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {


    @Environment(\.openImmersiveSpace) var openImmersiveSpace

    var body: some View {
        VStack {
            NavigationSplitView {
                List {
                    Text("Item")
                }
                .navigationTitle("Sidebar")
            } detail: {
                VStack {
                }
                .navigationTitle("Content")
                .padding()
            }
            Button("Open") {
                Task {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                }
            }
            Model3D(named: "Airplane", bundle: realityKitContentBundle)
                .gesture(TapGesture().targetedToAnyEntity().onEnded {value in     print("Tapped entity \(value.entity)!")
                })
            
        }
    }
}

#Preview {
    ContentView()
}
