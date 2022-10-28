//
//  ContactsRowView.swift
//  Drinko
//
//  Created by Filippo Cilia on 28/04/2021.
//

import SwiftUI

struct ContactsRowView: View {
    var imageName: String
    var text: String
    var subText: String

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 20, maxHeight: 20)

            Text(text) +
                Text(subText)
                .font(.caption)
                .foregroundColor(Color.secondary)
        }
        .frame(height: 40)
        .foregroundColor(.primary)
    }
}
