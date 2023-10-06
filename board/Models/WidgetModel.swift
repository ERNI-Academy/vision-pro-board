import SwiftUI
import Foundation

struct Widget: Equatable {
    let id = UUID()
    let view: AnyView
    let width: CGFloat
    let height: CGFloat
    
    static func == (lhs: Widget, rhs: Widget) -> Bool {
        return lhs.id == rhs.id
    }
}
