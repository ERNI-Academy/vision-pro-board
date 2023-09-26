import Foundation
import SwiftUI

final class PatientModelData: ObservableObject {
    @Published var patients: [Patient] = [Patient(
        name: "David",
        avatar: Image(systemName: "Person"))]
}
