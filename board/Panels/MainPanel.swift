import SwiftUI

struct MainPanel: View {
    @Binding var isStarted: Bool
    
    var body: some View {
        HStack {
            ResizableContainer(isLateral: isStarted) {
                if (!isStarted) {
                    WelcomePanel(isStarted: $isStarted)
                }
            }
            if (isStarted) {PanelsContainer()}
        }
    }
}

#Preview {
    MainPanel(isStarted: .constant(false))
        .environmentObject(AppStore())
}
