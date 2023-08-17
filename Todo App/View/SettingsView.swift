//
//  SettingsView.swift
//  Todo App
//
//  Created by Matheus Xavier on 16/08/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                Form {
                    Section {
                        FormRowLinkView(icon: "swift", color: .orange, text: "Swift", link: "https://developer.apple.com/xcode/swiftui/")
                        FormRowLinkView(icon: "keyboard", color: .indigo, text: "GitHub", link: "https://github.com/MatheusXavier15")
                        FormRowLinkView(icon: "link", color: .blue, text: "Linkedin", link: "https://www.linkedin.com/in/matheus-xavier-154ab6177/")
                    } header: {
                        Text("External websites")
                    }
                    .padding(.vertical, 3)
                    
                    Section {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Matheus")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } header: {
                        Text("About the application")
                    }
                    .padding(.vertical, 3)
                }
                
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                Text("Copyright © All rights reserved.\nBetter Apps Less Code.")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding()
                    .foregroundColor(Color.secondary)
            }
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
