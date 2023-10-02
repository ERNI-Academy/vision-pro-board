import SwiftUI

struct MainPanel: View {
    @Binding var isStarted: Bool
    
    var body: some View {
        if (!isStarted) {
            WelcomePanel(isStarted: $isStarted)
                .glassBackgroundEffect()
                .padding()
        } else {
            HStack {
                VStack {
                    PatientsList()
                }
                .frame(maxWidth: isStarted ? 300 : /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .glassBackgroundEffect()
                PanelsContainer()
            }
        }
    }
}

#Preview {
    MainPanel(isStarted: .constant(false))
        .environmentObject(AppStore())
        .environmentObject(PatientsStore())
}
