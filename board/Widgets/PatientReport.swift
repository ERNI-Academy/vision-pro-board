//
//  PatientReport.swift
//  vision-pro-board
//
//  Created by David Carmona on 29/9/23.
//

import SwiftUI

struct PatientReport: View {
    @EnvironmentObject var patientsStore: PatientsStore
    
    var body: some View {
        Text(patientsStore.patientSelected.name)
    }
}

#Preview {
    PatientReport()
        .environmentObject(PatientsStore())
}
