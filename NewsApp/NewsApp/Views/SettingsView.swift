//
//  SettingsView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display"),
                        footer: Text("System settings will override Dark Mode and user the current theme")
                ) {
                    Toggle(
                        isOn: .constant(true),
                        label: {
                            Text("Dark Mode")
                        }
                    )
                    
                    Toggle(
                        isOn: .constant(true),
                        label: {
                            Text("Use system settings")
                        }
                    )
                }
                
                Section {
                    Link(destination: URL(string: Constants.twitter)!,
                         label: {
                            Label("Follow me on twitter @AnotherDevBr", systemImage: "link")
                    })
                    
                    Link("Contact me via email",
                         destination: URL(string: Constants.email)!)
                    
                    Link("Call me",
                         destination: URL(string: Constants.phone)!)
                    
                }
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
