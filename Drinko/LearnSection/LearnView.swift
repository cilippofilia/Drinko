//
//  LearnView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct LearnView: View {
    let lessons = Bundle.main.decode([Subject].self, from: "lessons.json")
    let books = Bundle.main.decode([Book].self, from: "books.json")
    let spirits = Bundle.main.decode([Spirit].self, from: "spirits.json")
    
    static let learnViewTag: String? = "Learn"
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(lessons) { topic in
                        Section(header: Text(topic.name)) {
                            ForEach(topic.lessons) { lesson in
                                LearnRowView(lesson: lesson)
                            }
                        }
                    }
                    
                    Section(header: Text("Spirits")) {
                        ForEach(spirits) { spirit in
                            SpiritRowView(spirit: spirit)
                        }
                    }
                    
                    Section(header: Text("Suggested Books")) {
                        ForEach(books) { book in
                            BookRowView(book: book)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Learn")
        }
    }
}
