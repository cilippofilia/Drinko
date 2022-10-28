//
//  MailTopicDetailView.swift
//  Drinko
//
//  Created by Filippo Cilia on 09/02/2021.
//

import SwiftUI
import MessageUI

struct MailTopicDetailView: View {
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    @State private var isShowingMail = false
    
    @State private var setBugSubject = "I have found this bug in your app!"
    @State private var setFeatureSubject = "I have some great suggestions for your app!"
    @State private var setCollaborationSubject = "Let's work together!"

    let instagramDrinkoURL = URL(string: "https://instagram.com/drinko.app/")
    let twitterDevURL = URL(string: "https://twitter.com/cilippofilia/")
    let instagramDevURL = URL(string: "https://instagram.com/cilippofilia/")

    var body: some View {
        Form {
            Section(header: Text("Mail")) {
                Button(action: {
                    isShowingMail.toggle()
                }) {
                    SettingsRowView(icon: "ant.fill",
                                    color: .red,
                                    listItemName: "Report a bug")
                        .foregroundColor(.primary)
                }
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMail) {
                    MailView(result: $result, setSubject: $setBugSubject)
                }
                
                Button(action: {
                    isShowingMail.toggle()
                }) {
                    SettingsRowView(icon: "wand.and.rays",
                                    color: .blue,
                                    listItemName: "Request a feature")
                        .foregroundColor(.primary)

                }
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMail) {
                    MailView(result: $result, setSubject: $setFeatureSubject)
                }

                
                Button(action: {
                    isShowingMail.toggle()
                }) {
                    SettingsRowView(icon: "network",
                                    color: .blue,
                                    listItemName: "Collaborations")
                        .foregroundColor(.primary)
                }
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMail) {
                    MailView(result: $result, setSubject: $setCollaborationSubject)
                }
            }
            
            Section(header: Text("Social")) {
                Button(action: {
                    if UIApplication.shared.canOpenURL(instagramDrinkoURL!) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(instagramDrinkoURL!, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(instagramDrinkoURL!)
                        }
                    } else {
                        //redirect to safari because the user doesn't have Instagram
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(instagramDrinkoURL!, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(instagramDrinkoURL!)
                        }
                    }
                }) {
                    ContactsRowView(
                        imageName: "insta",
                        text: "@drinko.app",
                        subText: " - App"
                    )
                }
                
                Button(action: {
                    if UIApplication.shared.canOpenURL(instagramDevURL!) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(instagramDevURL!, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(instagramDevURL!)
                        }
                    } else {
                        //redirect to safari because the user doesn't have Instagram
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(instagramDevURL!, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(instagramDevURL!)
                        }
                    }
                }) {
                    ContactsRowView(
                        imageName: "insta",
                        text: "@cilippofilia",
                        subText: " - Developer"
                    )
                }

                Button(action: {
                    if UIApplication.shared.canOpenURL(twitterDevURL!) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(twitterDevURL!, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(twitterDevURL!)
                        }
                    } else {
                        //redirect to safari because the user doesn't have Instagram
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(twitterDevURL!, options: [:], completionHandler: nil)
                        } else {
                            UIApplication.shared.openURL(twitterDevURL!)
                        }
                    }
                }) {
                    ContactsRowView(
                        imageName: "twit",
                        text: "@cilippofilia",
                        subText: " - Developer"
                    )
                }
            }
            .navigationTitle("Contacts")
        }
    }
}
