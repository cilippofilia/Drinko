//
//  PurchaseButton.swift
//  Drinko
//
//  Created by Filippo Cilia on 24/04/2021.
//

import SwiftUI

struct PurchaseButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 200, minHeight: 44)
            .background(Color("Light Blue"))
            .clipShape(Capsule())
            .foregroundColor(Color.white)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
