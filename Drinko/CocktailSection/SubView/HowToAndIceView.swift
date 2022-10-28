//
//  CocktailHowToAndIce.swift
//  Drinko
//
//  Created by Filippo Cilia on 11/11/2020.
//

import SwiftUI

struct HowToAndIceView: View {
    var cocktail: Cocktail
    
    var body: some View {
        VStack(spacing: 20) {
            Text("How to")
                .font(Font.subheadline.bold())
            
            Text(cocktail.instructions)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                Text("Type of ice:")
                    .font(Font.subheadline.bold())
                
                Text(cocktail.ice)
                
                Spacer()
            }
        }
        .frame(width: screenWidthPlusMargins)
    }
}
