import SwiftUI

struct PatientRow: View {
    @EnvironmentObject var patientsStore: PatientsStore
    let patient: Patient
    
    var body: some View {
            Button(action: {
                patientsStore.patientSelected = patient
            }) {
                VStack {
                    patient.avatar
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Text(patient.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity)
            }
    }
}

#Preview {
    PatientRow(patient: Patient(id: 0, name: "David Carmona",
                                avatar: Image("DavidCarmona"), age: 50)).environmentObject(PatientsStore())
}
