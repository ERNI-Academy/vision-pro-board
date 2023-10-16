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
        VStack {
            patientsStore.patientSelected.avatar
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(20)
            Text(patientsStore.patientSelected.name)
            ScrollView(.vertical) {
                Text("Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.").padding(50)
            }
        }
        .glassBackgroundEffect()
    }
}

#Preview {
    PatientReport()
        .environmentObject(PatientsStore())
}
