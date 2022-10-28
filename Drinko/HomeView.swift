//
//  ContentView.swift
//  Drinko
//
//  Created by Filippo Cilia on 20/09/2020.
//

import CoreData
import SwiftUI
import StoreKit

struct HomeView: View {
    @AppStorage("appUsageCounter") var appUsageCounter: Int = 0
    @EnvironmentObject var dataController: DataController
    @SceneStorage("selectedView") var selectedView: String?
    
    @State private var showWhatsNew = false

    var body: some View {
        TabView(selection: $selectedView) {
            LearnView()
                .tag(LearnView.learnViewTag)
                .tabItem {
                    Image(systemName: "books.vertical")
                        .font(.headline)
                    Text("Learn")
                }
            
            CocktailListView()
                .tag(CocktailListView.cocktailsViewTag)
                .tabItem {
                    Image("cocktailIcon")
                        .renderingMode(.template)
                    Text("Cocktails")
                }
            
            CabinetView(dataController: dataController)
                .tag(CabinetView.cabinetViewTag)
                .tabItem {
                    Image("cabinetIcon")
                        .renderingMode(.template)
                    Text("Cabinet")
                }
                        
            SettingsView()
                .tag(SettingsView.settingsViewTag)
                .tabItem {
                    Image(systemName: "gear")
                        .font(.headline)
                    Text("Settings")
                }
        }
//        .sheet(isPresented: $showWhatsNew, content: { WhatsNewView() })
        .onAppear(perform: checkForUpdate)
        .onAppear(perform: checkForReview)
    }
    
    // Get current Version of the App
    func getCurrentAppVersion() -> String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        let version = (appVersion as! String)
        
        return version
    }
    
    // Check if app if app has been started after update
    func checkForUpdate() {
        let version = getCurrentAppVersion()
        let savedVersion = UserDefaults.standard.string(forKey: "savedVersion")

        if savedVersion != version {
            // Toggle to show WhatsNew Screen as Modal
            showWhatsNew = true
            UserDefaults.standard.set(version, forKey: "savedVersion")
            
        } else {
            showWhatsNew = false
        }
    }
    
    func checkForReview() {
        guard let scene = UIApplication.shared.currentScene else { return }
        
        appUsageCounter += 1
        
        if appUsageCounter == 10 {
            SKStoreReviewController.requestReview(in: scene)
            
        } else if appUsageCounter == 50 {
            SKStoreReviewController.requestReview(in: scene)
            
        } else if appUsageCounter == 150 {
            SKStoreReviewController.requestReview(in: scene)
            
        } else if appUsageCounter > 300 {
            appUsageCounter = 0
        }
    }
}

extension UIApplication {
    var currentScene: UIWindowScene? {
        connectedScenes
            .first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}
