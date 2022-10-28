//
//  SettingsRowView.swift
//  Drinko
//
//  Created by Filippo Cilia on 22/09/2020.
//

import SwiftUI

struct SettingsRowView: View {
    var icon: String
    var color: Color
    var listItemName: LocalizedStringKey
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundColor(color)
                .frame(minWidth: 30, minHeight: 30)
            
            Text(listItemName)
        }
        .frame(height: 40)
    }
}
