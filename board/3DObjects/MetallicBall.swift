import SwiftUI
import RealityKit
import RealityKitContent

struct MetallicBall: View {
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .white, isMetallic: true)])
            content.add(model)
        }
    }
}

#Preview {
    MetallicBall()
        .previewLayout(.sizeThatFits)
}
