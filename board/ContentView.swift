import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @EnvironmentObject var appStore: AppStore
    
    var body: some View {
        MainPanel(isStarted: $appStore.isStarted)
    }
}

#Preview {
    ContentView().environmentObject(AppStore())
}
