//
//  Book.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct Book: Codable, Equatable, Identifiable {
    let id: String
    var title: String
    var description: String
    var author: String
    
    var image: String {
        id
    }
    
    #if DEBUG
    static let example = Book(id: "example",
                              title: "Liquid Intelligence",
                              description: "Description of the book",
                              author: "Example Author")
    #endif
}
