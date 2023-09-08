//
//  ImmersiveView.swift
//  board
//
//  Created by David Carmona on 7/9/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await
                Entity(named: "Airplane", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)
            }
        }.gesture(TapGesture().targetedToAnyEntity().onEnded {value in
            var transform = value.entity.transform
            transform.translation += SIMD3(0.1, 0, -0.1)
            value.entity.move(
                to: transform,
                relativeTo: nil,
                duration: 3,
                timingFunction: .easeInOut
            )
        })
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
