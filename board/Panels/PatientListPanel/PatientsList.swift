import SwiftUI

struct PatientsList: View {
    @EnvironmentObject var patientsStore: PatientsStore
    
    var body: some View {
        List(patientsStore.patients, id: \.id) { patient in
            PatientRow(patient: patient)
        }
    }
}

#Preview {
    PatientsList().environmentObject(PatientsStore())
}
