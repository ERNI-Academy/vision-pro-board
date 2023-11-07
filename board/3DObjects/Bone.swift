import SwiftUI
import RealityKit
import RealityKitContent

struct Bone: View {
    @State private var rotation: Angle = .zero
    @State private var bone: Entity?

    var body: some View {
        RealityView {content in
            if let boneEntity = try? await Entity(
                named: "Bones", in: realityKitContentBundle
            ) {
                boneEntity.scale = SIMD3<Float>(10, 10, 10)
                boneEntity.position = SIMD3<Float>(0, 1.7, -1)
                content.add(boneEntity)
                bone = boneEntity
            }
        }.gesture(DragGesture().onChanged { value in
            let angle = Angle(degrees: Double(value.translation.width))
            rotation = angle
            if let boneEntity = bone {
                let transform = Transform(rotation: simd_quatf(angle: Float(rotation.radians), axis: SIMD3<Float>(0, 1, 0)))
                boneEntity.move(to: transform, relativeTo: boneEntity, duration: 0.1, timingFunction: .linear)
            }
        })
    }
}

#Preview {
    Bone().previewLayout(.sizeThatFits)
}

