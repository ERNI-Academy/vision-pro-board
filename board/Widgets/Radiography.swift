//
//  Radiography.swift
//  vision-pro-board
//
//  Created by David Carmona on 11/10/23.
//

import SwiftUI

struct Radiography: View {
    @State private var isSpaceHidden: Bool = true
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button (isSpaceHidden ? "View 3d model" : "Hide 3d model") {
            Task {
                if isSpaceHidden {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                    isSpaceHidden = false
                } else {
                    await dismissImmersiveSpace()
                    isSpaceHidden = true
                }
                
            }
        }
    }
}

#Preview {
    Radiography()
}
