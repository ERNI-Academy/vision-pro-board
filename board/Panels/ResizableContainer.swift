import SwiftUI

struct ResizableContainer<Content: View>: View {
    @EnvironmentObject var appStore: AppStore
    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                content
            }
            .onAppear {
                if !appStore.isStarted {
                    width = geometry.size.width
                    height = geometry.size.height
                } else {
                    width = 300
                    height = geometry.size.height
                }
            }
            .onChange (of: appStore.isStarted) {
                withAnimation{
                    if (!appStore.isStarted) { width = geometry.size.width }
                    else {width = 300}
                    height = geometry.size.height
                }
            }
            .onChange (of: geometry.size.height) {
                if (!appStore.isStarted) { width = geometry.size.width }
                else {width = 300}
                height = geometry.size.height
            }
            .padding()
            .frame(width: width, height: height)
            .glassBackgroundEffect()
        }
    }
}

struct ResizableContainer_Previews: PreviewProvider {
    static var previews: some View {
        ResizableContainer {
            Text("") // Aquí envolvemos Text("") dentro del cierre.
        }
        .environmentObject(AppStore())
    }
}
