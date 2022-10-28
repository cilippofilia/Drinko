//
//  DrinkoButtons.swift
//  Drinko
//
//  Created by Filippo Cilia on 28/04/2021.
//

import SwiftUI

struct DrinkoButtonStyle: View {
    var symbolName: String
    var buttonText: LocalizedStringKey
    var backgroundColor: Color

    var body: some View {
        HStack {
            Image(systemName: symbolName)
                .imageScale(.large)

            Text(buttonText)
        }
        .font(.headline.bold())
        .frame(height: 50)
        .frame(maxWidth: screenWidthPlusMargins)
        .foregroundColor(Color.white)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct StartAndResetButtons: View {
    var text: String
    var multiplier: CGFloat

    var body: some View {
        Text(text.uppercased())
            .font(.system(.headline, design: .rounded))
            .foregroundColor(.white)
            .frame(width: 120, height: 50)
            .background(Color.red)
            .clipShape(Capsule())
            .animation(.default)
            .padding(.horizontal)
            .shadow(color: Color.red.opacity(0.2), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
    }
}
