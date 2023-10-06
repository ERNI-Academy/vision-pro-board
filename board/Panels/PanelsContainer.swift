import SwiftUI

struct PanelsContainer: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                self.generateContent(in: geometry)
            }
        }
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(WidgetsIndex, id: \.id) { widget in
                self.item(for: widget.view, width: widget.width, height: widget.height)
                    .padding([.horizontal, .vertical], 20)
                    .alignmentGuide(.leading , computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if widget == WidgetsIndex.last! {
                            width = 0 // Último elemento
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if widget == WidgetsIndex.last! {
                            height = 0 // Último elemento
                        }
                        return result
                    })
            }
        }
    }

    func item(for view: AnyView, width: CGFloat, height: CGFloat) -> some View {
        view
            .frame(width: width, height: height)
            .foregroundColor(.white)
    }
}

#Preview {
    PanelsContainer()
        .environmentObject(AppStore())
        .environmentObject(PatientsStore())
}
