//
//  LearnDetailView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct LearnDetailView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var isShowingRing = false
    
    var lesson: Lesson
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 18) {
                Image(lesson.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screenWidth, height: 280, alignment: .center)
                    .clipped()
            
                Text(lesson.title)
                    .bold()
                    .frame(minWidth: 100, maxWidth: screenWidthPlusMargins)
                    .font(.system(.title, design: .rounded))
                
                Text(lesson.description)
                    .frame(minWidth: 100, maxWidth: screenWidthPlusMargins)
                    .font(.headline)
                    .foregroundColor(Color.secondary)
                
                
                Text(lesson.body)
                    .frame(minWidth: 100, maxWidth: screenWidthPlusMargins)
                    .font(.body)
                    .padding(.bottom, lesson.id == "how-to-shake" || lesson.id == "how-to-stir" ? 0 : 20)

                VStack(spacing: 10) {
                    if lesson.hasVideo {
                        Link(destination: URL(string: lesson.videoURL!)!) {
                            DrinkoButtonStyle(
                                symbolName: "video.fill",
                                buttonText: "Watch Video",
                                backgroundColor: .blue
                            )
                        }
                    }

                    if lesson.id == "how-to-shake" || lesson.id == "how-to-stir" {
                        NavigationLink(destination: PracticeRingView()) {
                            DrinkoButtonStyle(
                                symbolName: "timer",
                                buttonText: "Practice your timing",
                                backgroundColor: .blue
                            )
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationBarTitle(lesson.title, displayMode: .inline)
    }
}
