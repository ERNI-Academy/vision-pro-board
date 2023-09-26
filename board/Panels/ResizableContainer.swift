import SwiftUI

struct SizableContainer<Content: View>: View {
    @EnvironmentObject var appStore: AppStore
    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0
    var geometry: GeometryProxy
    var childView: Content
    
    var body: some View {
        VStack {
            childView
        }
        .onAppear {
            calculateInitialPosition(isStarted: appStore.isStarted, geometry: geometry, width: &width, height: &height)
        }
        .onChange (of: appStore.isStarted) {
            withAnimation{
                changeListPanelSize(isStarted: appStore.isStarted, geometry: geometry, width: &width, height: &height)
            }
        }
        .onChange (of: geometry.size.height) {
            changeListPanelSize(isStarted: appStore.isStarted, geometry: geometry, width: &width, height: &height)
        }
        .padding()
        .frame(width: width, height: height)
        .glassBackgroundEffect()
    }
}
