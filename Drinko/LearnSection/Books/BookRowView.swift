//
//  BookRowView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct BookRowView: View {
    var book: Book
    
    var body: some View {
        HStack {
            Image(book.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 66, height: 66, alignment: .center)
                .clipShape(
                    Circle()
                )
            
            VStack(alignment: .leading, spacing: 6) {
                Text(book.title)
                    .font(.headline)
                
                Text(book.description.isEmpty ? "N.A." : book.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Image(systemName: "c.circle")
                        .imageScale(.small)
                        .foregroundColor(.secondary)
                    
                    Text(book.author)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
        }
    }
}
