//
//  CocktailListView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct CocktailListView: View {
    @ObservedObject var favorites = Favorites()
    
    @State private var showAlert = false
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    let categories = Bundle.main.decode([Category].self, from: "cocktails.json")
    
    static let cocktailsViewTag: String? = "Cocktails"

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(categories) { category in
                        Section(header:
                                    HStack {
                                        Text(category.name)
                                        
                                        Button(action: {
                                            showAlert = true
                                            
                                            if category.id == "on-the-rocks" {
                                                alertTitle = category.name
                                                alertMessage = category.glassInfo
                                                
                                            } else if category.id == "long-drink" {
                                                alertTitle = category.name
                                                alertMessage = category.glassInfo
                                                
                                            } else if category.id == "short-drink" {
                                                alertTitle = category.name
                                                alertMessage = category.glassInfo
                                                
                                            }
                                        }) {
                                            Image(systemName: "info.circle")
                                                .foregroundColor(Color.blue)
                                                .padding(8)
                                        }
                                        
                                        Spacer()
                                    
                                    }) {
                            
                            ForEach(category.cocktails) { cocktail in
                                CocktailRowView(favorites: favorites, cocktail: cocktail)
                                    .contextMenu {
                                        Button(action: {
                                            if favorites.contains(cocktail) {
                                                favorites.remove(cocktail)
                                                
                                            } else {
                                                favorites.add(cocktail)
                                                
                                                UINotificationFeedbackGenerator()
                                                    .notificationOccurred(.success)
                                            }
                                        }) {
                                            Image(systemName: "heart")
                                            
                                            Text(favorites.contains(cocktail) ? "Remove from favorites" : "Add to favorites")
                                        }
                                    }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Cocktails")
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .environmentObject(favorites)
    }
}
