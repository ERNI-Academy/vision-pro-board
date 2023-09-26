import SwiftUI

struct MainPanel: View {
    @Binding var isStarted: Bool
    
    var body: some View {
        HStack {
            ResizableContainer {
                if (!isStarted) {
                    WelcomePanel(isStarted: $isStarted)}
                else {
                    PatientsList()
                }
            }
            PanelsContainer()
        }
    }
}

#Preview {
    MainPanel(isStarted: .constant(false))
        .environmentObject(AppStore())
}
