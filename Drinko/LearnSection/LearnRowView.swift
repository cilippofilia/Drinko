//
//  LearnRowView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct LearnRowView: View {
    var lesson: Lesson
        
    var body: some View {
        NavigationLink(destination: LearnDetailView(lesson: lesson)) {
            HStack {
                Image(lesson.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(lesson.title)
                        .font(.headline)
                    
                    Text(lesson.description.isEmpty ? "N.A." : lesson.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
            }
        }
    }
}
