//
//  AppIcon.swift
//  Drinko
//
//  Created by Filippo Cilia on 19/01/2021.
//

import SwiftUI

struct AppIcon: View {
    var iconImageName: String
    var iconName: String
    
    var body: some View {
        HStack {
            Image(iconImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(4)
                            
            Text(iconName)
                .foregroundColor(Color.primary)
        }
    }
}
