//
//  CocktailRowView.swift
//  Drinko
//
//  Created by Filippo Cilia on 21/09/2020.
//

import SwiftUI

struct CocktailRowView: View {
    @ObservedObject var favorites = Favorites()

    var cocktail: Cocktail
    
    var body: some View {
        NavigationLink(destination: CocktailDetailView(favorites: favorites, cocktail: cocktail)) {
                HStack {
                    Image(cocktail.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(cocktail.name)
                        
                        if cocktail.description.isEmpty == false {
                            Text(cocktail.description)
                                .font(.footnote)
                                .foregroundColor(Color.secondary)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: favorites.contains(cocktail) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .opacity(favorites.contains(cocktail) ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5))
                }
                .frame(height: 60)
            }
    }
}
