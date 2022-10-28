//
//  Spirits.swift
//  Drinko
//
//  Created by Filippo Cilia on 10/01/2021.
//

import SwiftUI

struct Spirit: Codable, Equatable, Identifiable {
    let id: String
    var title: String
    var text: String
    
    var image: String {
        id
    }
    
    #if DEBUG
    static let example = Spirit(id: "example",
                                 title: "Example Spirit",
                                 text: "Example description and origin of the spirit.")
    #endif
}
