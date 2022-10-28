//
//  CocktailIngredientsGarnishView.swift
//  Drinko
//
//  Created by Filippo Cilia on 11/11/2020.
//

import SwiftUI

struct IngredientsAndGarnishView: View {
    var cocktail: Cocktail
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Ingredients")
                .font(Font.subheadline.bold())
            
            HStack(alignment: .firstTextBaseline) {
                Text(cocktail.measures.joined(separator: "\n"))
                    .font(.headline)
                    .multilineTextAlignment(.trailing)
                
                Text(cocktail.ingredients.joined(separator: "\n"))
                
                Spacer()
            }
            .fixedSize(horizontal: false, vertical: true)

            HStack(alignment: .firstTextBaseline) {
                Text("Garnish")
                    .font(Font.subheadline.bold())
                
                Text(cocktail.garnish.isEmpty ? "No garnish needed" : cocktail.garnish)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
        .frame(width: screenWidthPlusMargins)
    }
}
