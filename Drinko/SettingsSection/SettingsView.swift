//
//  SettingsView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import SwiftUI

struct SettingsView: View {        
    static let settingsViewTag: String? = "Settings"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Customize")) {
                    HStack {
                        SettingsRowView(icon: "text.bubble.fill",
                                        color: .secondary,
                                        listItemName: "Language")
                        
                        Spacer()
                        
                        Text(Bundle.main.preferredLocalizations.first!.uppercased())
                            .foregroundColor(Color.secondary)
                    }
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    }
                    
                    if UIApplication.shared.supportsAlternateIcons {
                        NavigationLink(destination: ListIconView()) {
                            SettingsRowView(icon: "paintbrush.fill",
                                            color: .green,
                                            listItemName: "App Icon")
                        }
                    }
                }

                Section(header: Text("Helpers")) {
                    NavigationLink(destination: PracticeRingView()) {
                        SettingsRowView(icon: "timer",
                                        color: .orange,
                                        listItemName: "Practice Timing")
                    }

                    NavigationLink(destination: MailTopicDetailView()) {
                        SettingsRowView(icon: "paperplane",
                                        color: .blue,
                                        listItemName: "Contacts")
                    }
                }
                
                
                Section(header: Text("Info"), footer: Text("Product of ") + Text("Italy 🇮🇹").bold()) {
                    NavigationLink(destination: CreditsView()) {
                        SettingsRowView(icon: "c.circle",
                                        color: .secondary,
                                        listItemName: "Drinko")
                    }
                    
                    HStack {
                        SettingsRowView(icon: "info.circle", color: .secondary, listItemName: "App version")
                        
                        Spacer()
                        
                        Text("\(getCurrentAppVersion())")
                    }
                }                
            }
            .navigationBarTitle("Settings")
        }
    }
    
    // Get current Version of the App
    func getCurrentAppVersion() -> String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        let version = (appVersion as! String)
        
        return version
    }
}
