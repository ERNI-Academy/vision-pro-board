import SwiftUI

@main
struct boardApp: App {
    @StateObject private var appStore = AppStore()
    @StateObject private var patientsStore = PatientsStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appStore)
                .environmentObject(patientsStore)
        }.windowStyle(.plain)
            .defaultSize(width: 2000, height: 1000)

        ImmersiveSpace(id: "Radiography") {
            Bone()
        }
    }
}
