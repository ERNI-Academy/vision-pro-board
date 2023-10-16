import SwiftUI
import RealityKit
import RealityKitContent

struct Bone: View {
    var body: some View {
        RealityView {content in
            if let bone = try? await Entity(
                named: "Bones", in: realityKitContentBundle
            ) {
                bone.scale = SIMD3<Float>(10, 10, 10)
                bone.position = SIMD3<Float>(0, 1.7, -1)
                content.add(bone)
            }
        }.gesture(TapGesture().targetedToAnyEntity().onEnded { value in
            var transform = value.entity.transform
            transform.translation += SIMD3(1, 0, -0.1)
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
    Bone().previewLayout(.sizeThatFits)
}

