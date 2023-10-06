import Foundation
import SwiftUI

let WidgetsIndex = [
    Widget(view: AnyView(PatientReport()), width: 600, height: 500),
    Widget(view: AnyView(PatientHeartBeat(isOverview: false)), width: 1000, height: 500),
    Widget(view: AnyView(PatientHeartBeat(isOverview: false)), width: 400, height: 500)
]
