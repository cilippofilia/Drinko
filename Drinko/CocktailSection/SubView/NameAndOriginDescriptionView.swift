//
//  CocktailImageNameOriginDescriptionView.swift
//  Drinko
//
//  Created by Filippo Cilia on 11/11/2020.
//

import SwiftUI

struct NameAndOriginDescriptionView: View {
    var cocktail: Cocktail
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text(cocktail.name)
                    .font(.system(.title, design: .rounded))
                    .bold()
                
                VStack(spacing: 10) {
                    Image(cocktail.origin)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(x: cocktail.origin == "US" || cocktail.origin == "Puerto Rico" ? 8 : 0)
                        .offset(x: cocktail.origin == "Cuba" ? 15 : 0)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(lineWidth: 0.5).opacity(0.5))
                        .frame(width: 35, height: 35)

                    
                    Text(cocktail.origin)
                        .font(.subheadline).bold()
                        .foregroundColor(.secondary)
                }
            }
            
            Text(cocktail.description.uppercased())
                .font(.subheadline).bold()
                .foregroundColor(.secondary)
            
        }
        .frame(width: screenWidthPlusMargins)
    }
}
