//
//  PatientModel.swift
//  vision-pro-board
//
//  Created by David Carmona on 13/9/23.
//

import Foundation
import SwiftUI

struct Patient {
    var id: Int
    var name: String
    var avatar: Image
    var age: Int
}

struct Widget: Equatable {
    let id = UUID()
    let view: AnyView
    let width: CGFloat
    let height: CGFloat
    
    static func == (lhs: Widget, rhs: Widget) -> Bool {
        return lhs.id == rhs.id
    }
}
