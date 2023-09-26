//
//  panelsContainer.swift
//  vision-pro-board
//
//  Created by David Carmona on 20/9/23.
//

import SwiftUI

struct PanelsContainer: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ResizableContainer {
            ScrollView {
                LazyHGrid(rows: columns, spacing: 16) {
                    ForEach(0..<10, id: \.self) { index in
                        VStack {
                            Text("Widget \(index + 1)")
                                .frame(width: 200, height: 200)
                                .glassBackgroundEffect()
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    PanelsContainer().environmentObject(AppStore())
}
