import Foundation
import SwiftUI

final class PatientsStore: ObservableObject {
    @Published var patients: [Patient] = Patiens
    @Published var patientSelected: Patient = Patient(
        id: -1,
        name: "Unknown",
        avatar: Image(systemName: "person"),
        age: -1)
}
