//
//  CocktailDetailView.swift
//  Drinko
//
//  Created by Filippo Cilia on 21/09/2020.
//

import SwiftUI

struct CocktailDetailView: View {
    @ObservedObject var favorites = Favorites()
    
    @State private var showNoteView = false
    
    var cocktail: Cocktail
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Image(cocktail.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth, alignment: .center)
            
//          MARK: NAME, ORIGIN AND DESCRIPTION
            NameAndOriginDescriptionView(cocktail: cocktail)
                .padding()
            
//          MARK: INGREDIENTS & GARNISH
            IngredientsAndGarnishView(cocktail: cocktail)
                .padding()
            
//          MARK: HOW TO & TYPE OF ICE
            HowToAndIceView(cocktail: cocktail)
                .padding()
            
//          MARK: GLASS & METHOD
            GlassAndMethodView(cocktail: cocktail)
                .padding()
            
            Spacer()
                .frame(height: 30)

//          MARK: HISTORY BUTTON
            VStack(spacing: 10) {
                NavigationLink(destination: HistoryView(cocktail: cocktail)) {
                    DrinkoButtonStyle(
                        symbolName: "book.fill",
                        buttonText: "History",
                        backgroundColor: .blue
                    )
                }

//          MARK: ADD TO FAV BUTTON
                Button(action: {
                    withAnimation {
                        if favorites.contains(cocktail) {
                            favorites.remove(cocktail)
                        } else {
                            favorites.add(cocktail)

                            UINotificationFeedbackGenerator()
                                .notificationOccurred(.success)
                        }
                    }
                }) {
                    DrinkoButtonStyle(
                        symbolName: "heart.fill",
                        buttonText: favorites.contains(cocktail) ? "Remove from favorites" : "Add to favorites",
                        backgroundColor: favorites.contains(cocktail) ? Color.red : Color.blue
                    )
                }
            }
            .padding(.vertical)
        }
        .navigationBarTitle(cocktail.name, displayMode: .inline)
    }
}
