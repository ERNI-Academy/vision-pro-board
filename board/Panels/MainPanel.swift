import SwiftUI

struct MainPanel: View {
    @Binding var isStarted: Bool
    @State private var isSpaceHidden: Bool = true
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    var body: some View {
        if (isStarted) {
            WelcomePanel(isStarted: $isStarted)
                .glassBackgroundEffect()
                .padding()
        } else {
            HStack {
                VStack {
                    PatientsList()
                }
                .frame(maxWidth: !isStarted ? 300 : /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .glassBackgroundEffect()
                PanelsContainer()
                Button (isSpaceHidden ? "View 3d model" : "Hide 3d model") {
                    Task {
                        if isSpaceHidden {
                            await openImmersiveSpace(id: "Radiography")
                            isSpaceHidden = false
                        } else {
                            await dismissImmersiveSpace()
                            isSpaceHidden = true
                        }
                        
                    }
                }.background(.black)
            }
        }
    }
}

#Preview {
    MainPanel(isStarted: .constant(false))
        .environmentObject(AppStore())
        .environmentObject(PatientsStore())
}
