//
//  PatientListContainer.swift
//  vision-pro-board
//
//  Created by David Carmona on 20/9/23.
//

import SwiftUI

struct PatientListContainer: View {
    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0
    @Binding var isStarted: Bool
    
    var body: some View {
        let view: View
        let geometry: GeometryProxy
        
        VStack {
            view
        }
        .onAppear {
            calculateInitialPosition(isStarted: isStarted, geometry: geometry, width: &width, height: &height)
        }
        .onChange (of: isStarted) {
            withAnimation{
                changeListPanelSize(isStarted: isStarted, geometry: geometry, width: &width, height: &height)
            }
        }
        .onChange (of: geometry.size.height) {
            withAnimation{
                changeListPanelSize(isStarted: isStarted, geometry: geometry, width: &width, height: &height)
            }
        }
        .padding()
        .frame(width: width, height: height)
        .glassBackgroundEffect()
    }
}

#Preview {
    PatientListContainer()
}
