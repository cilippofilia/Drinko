//
//  ListIconView.swift
//  Drinko
//
//  Created by Filippo Cilia on 28/10/2022.
//

import SwiftUI

struct ListIconView: View {
    @State private var originalAppIconSelected = true

    var body: some View {
        List {
            Button(action: {
                UIApplication.shared.setAlternateIconName(nil) { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success!")
                    }
                }

                originalAppIconSelected = true
            }) {
                AppIcon(iconImageName: "BlueTemp",
                        iconName: "Original")
            }

            Button(action: {
                UIApplication.shared.setAlternateIconName("ModernBlue") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success!")
                    }
                }

                originalAppIconSelected = false
            }) {
                AppIcon(iconImageName: "ModernBlueTemp",
                        iconName: "Modern Blue")
            }

            Button(action: {
                UIApplication.shared.setAlternateIconName("NeonRed") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success!")
                    }
                }

                originalAppIconSelected = false
            }) {
                AppIcon(iconImageName: "NeonRedTemp",
                        iconName: "Neon Red")
            }

            Button(action: {
                UIApplication.shared.setAlternateIconName("NeonBlue") { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Success!")
                    }
                }
                originalAppIconSelected = false
            }) {
                AppIcon(iconImageName: "NeonBlueTemp",
                        iconName: "Neon Blue")
            }
        }
        .navigationTitle("App Icon")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ListIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListIconView()
        }
    }
}
