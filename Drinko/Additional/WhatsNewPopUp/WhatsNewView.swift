//
//  WhatsNewView.swift
//  Drinko
//
//  Created by Filippo Cilia on 03/01/2021.
//

import SwiftUI

struct WhatsNewView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    WhatsNewRowView(icon: "doc.richtext",
                                    color: .orange,
                                    title: "History has been added",
                                    description: "I have added the history of each cocktail in the 'Cocktails' tab.")
                    
                    WhatsNewRowView(icon: "app.badge",
                                    color: .blue,
                                    title: "Drinko Plus",
                                    description: "For the first 50 people it will be free, hit me up and I'll send you a promo code, but after that, if you'd like to add more than 6 categories in the 'Cabinet' tab, you will have to pay a tiny amount")

                    WhatsNewRowView(icon: "app.badge",
                                    color: .red,
                                    title: "Improved Icons",
                                    description: "Just went through the icons, removed the one that I didn't like and improved the rest.")

                    WhatsNewRowView(icon: "video.fill",
                                    color: .green,
                                    title: "Watch the Videos",
                                    description: "I have made a couple of short videos available for everyone that learn better by watching instead of reading. I will probably add more in the future.")
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Dismiss")
                        .font(Font.headline.bold())
                        .frame(height: 60)
                        .frame(minWidth: 100, maxWidth: screenWidthPlusMargins)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .contentShape(Rectangle())
                        .padding(.vertical)
                }
            }
            .navigationBarTitle("What's new?", displayMode: .inline)
        }
    }
}
