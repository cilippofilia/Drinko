//
//  CocktailGlassMethodView.swift
//  Drinko
//
//  Created by Filippo Cilia on 11/11/2020.
//

import SwiftUI

struct GlassAndMethodView: View {    
    var cocktail: Cocktail
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack {
                Text(cocktail.glass)
                    .font(Font.subheadline.bold())
                    .padding(.bottom, 5)
                
                Image(cocktail.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .bottom)
            }
            
            Spacer()
                .frame(width: screenWidth / 5)
            
            VStack {
                Text(cocktail.method)
                    .font(Font.subheadline.bold())
                    .padding(.bottom, 10)
                
                Image(cocktail.method == "Reverse dry shake" ? "Shake and strain" : cocktail.method)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
        }
        .frame(width: screenWidthPlusMargins)
    }
}
