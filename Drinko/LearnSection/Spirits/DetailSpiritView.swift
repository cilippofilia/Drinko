//
//  DetailSpiritView.swift
//  Drinko
//
//  Created by Filippo Cilia on 10/01/2021.
//

import SwiftUI

struct DetailSpiritView: View {
    var spirit: Spirit
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 18) {
                Image(spirit.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screenWidth, height: 280, alignment: .center)
                    .clipped()
                
                Text(spirit.title)
                    .bold()
                    .frame(minWidth: 100, maxWidth: screenWidthPlusMargins)
                    .font(.system(.title, design: .rounded))
                
                Text(spirit.text)
                    .frame(minWidth: 100, maxWidth: screenWidthPlusMargins)
                    .font(.body)
            }
            .padding(.bottom)
        }
        .navigationBarTitle(spirit.title, displayMode: .inline)
    }
}
