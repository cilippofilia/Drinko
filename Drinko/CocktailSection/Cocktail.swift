//
//  Cocktail.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct Category: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let glassInfo: String
    let cocktails: [Cocktail]
}

struct Cocktail: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let origin: String
    let description: String
    let category: String
    let glass: String
    let instructions: String
    let method: String
    let ice: String
    let garnish: String
    let history: String
    
    let ingredients: [String]
    let measures: [String]
    
    var image: String {
        id + "-img"
    }
    
    var icon: String {
        id + "-icon"
    }
    
    #if DEBUG
    static let example = Cocktail(
        id: "zombie",
        name: "Zombie",
        origin: "U.S.A.",
        description: "example, example, example, example",
        category: "Long drink",
        glass: "Higball",
        instructions: "Dice a lime and put it inside a rock glass, add sugar or syrup, gently muddle to express the oils and juice of the lime, fill the glass with ice and add the spirit, churn it quickly to give dilution and to mix the ingredients together.",
        method: "Shake and strain",
        ice: "Cubed ice",
        garnish: "Orange peel, lemon slice, celery stick, pickles, carrots, sausage roll",
        history: "Whiskey",
        ingredients: [
        "Jamaican Dark Rum",
        "Demerara Rum",
        "Overproof Rum",
        "Lime juice",
        "Velvet Falernum",
        "Pineapple juice",
        "Cinnamon syrup",
        "Angostura bitters"
    ], measures: [
        "35 ml",
        "25 ml",
        "10 ml",
        "20 ml",
        "15 ml",
        "50 ml",
        "15 ml",
        "2 dashes"
    ])
    #endif
}
