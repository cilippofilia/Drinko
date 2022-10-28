//
//  SpiritRowView.swift
//  Drinko
//
//  Created by Filippo Cilia on 10/01/2021.
//

import SwiftUI

struct SpiritRowView: View {
    var spirit: Spirit
    
    var body: some View {
        NavigationLink(destination: DetailSpiritView(spirit: spirit)) {
            HStack {
                Image(spirit.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 66, height: 66, alignment: .center)
                    .clipShape(
                        Circle()
                    )
                
                Text(spirit.title)
                    .font(.headline)
                
                Spacer()
            }
        }
    }
}
