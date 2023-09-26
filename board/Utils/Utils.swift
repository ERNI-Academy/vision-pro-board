import Foundation
import SwiftUI

func calculateInitialPosition(isStarted: Bool, geometry: GeometryProxy, width: inout CGFloat, height: inout CGFloat) {
    if !isStarted {
        width = geometry.size.width
        height = geometry.size.height
    } else {
        width = 300
        height = geometry.size.height
    }
}
	
func changeListPanelSize(isStarted: Bool, geometry: GeometryProxy, width: inout CGFloat, height: inout CGFloat) {
    withAnimation {
        if (!isStarted) { width = geometry.size.width }
        else {width = 300}
        height = geometry.size.height
    }
}
