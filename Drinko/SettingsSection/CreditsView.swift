//
//  AcknowledgementsView.swift
//  Home-Tender
//
//  Created by Filippo Cilia on 04/07/2020.
//  Copyright © 2020 Filippo Cilia. All rights reserved.
//

import SwiftUI

struct CreditsView: View {
    @State private var rant: LocalizedStringKey =
    """
    The content of this app is based on my knowledge, which I have developed over the past years, since I have started working as a bartender, and informations collected around the internet, from friends and colleagues, and from different books.

    Remember that TASTE is subjective, use this app as a guideline to know better your taste, to learn how to make all the cocktails that you like at home, discover some new ones and maybe create your own, and ultimately learn tips and tricks of professional bartending.

    At the end of the day, if you like the drink sitting in front of you, you did it right.
    """
    
    var body: some View {
        VStack {
            Text(rant)
                .multilineTextAlignment(.leading)
                .padding()

            Spacer()

        }
        .navigationBarTitle("Drinko")
    }
}
