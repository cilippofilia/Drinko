//
//  WhatsNewRowView.swift
//  Drinko
//
//  Created by Filippo Cilia on 03/01/2021.
//

import SwiftUI

struct WhatsNewRowView: View {
    var icon: String
    var color: Color
    var title: LocalizedStringKey
    var description: LocalizedStringKey
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font((.system(size: 28, weight: .semibold, design: .rounded)))
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .fixedSize(horizontal: true, vertical: true)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(Color.secondary)
            }
        }
        .padding(.vertical)
    }
}
