//
//  HistoryView.swift
//  Drinko
//
//  Created by Filippo Cilia on 30/03/2021.
//

import SwiftUI

struct HistoryView: View {
    var cocktail: Cocktail
    
    var body: some View {
        VStack(spacing: 20) {
            Text(cocktail.name)
                .font(.system(.title, design: .rounded))
                .bold()
                .padding(.top)
            
            Text(cocktail.history)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .frame(width: screenWidthPlusMargins)
    }
}
