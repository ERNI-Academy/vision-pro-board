//
//  DrugsList.swift
//  vision-pro-board
//
//  Created by David Carmona on 6/10/23.
//

import SwiftUI

struct DrugsList: View {
    
    var drugsList: [Drug]
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                HStack {
                    item(for: Image(systemName: "cross.case.fill"), name: "Flogoprofen", specifications: "500mg").padding()
                    Toggle(isOn: .constant(false)) {
                    }.padding()
                }
            }
        }
    }
}

func item(for image: Image, name: String, specifications: String) -> some View {
    HStack {
        image
            .resizable()
            .frame(width: 40, height: 40)
            .padding(10)
        VStack (alignment: .leading) {
            Text(name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(specifications).font(.subheadline)
        }
        Spacer()
        }
}

#Preview {
    DrugsList(drugsList: [Drug(id: 0, name: "Flogoprofen", isSelected: false, image: Image(systemName: "cross.case.fill"))])
}
