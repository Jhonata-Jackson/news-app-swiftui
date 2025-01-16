//
//  SettingsView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var darkModeEnable: Bool
    @Binding var systemThemeEnable: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display"),
                        footer: Text("System settings will override Dark Mode and user the current theme")
                ) {
                    Toggle(
                        isOn: $darkModeEnable,
                        label: {
                            Text("Dark Mode")
                        }
                    )
                    .onChange(of: darkModeEnable, perform: { _ in
                        SystemThemeManager.shared.handleTheme(
                            darkMode: darkModeEnable,
                            system: systemThemeEnable
                        )
                    })
                    
                    Toggle(
                        isOn: $systemThemeEnable,
                        label: {
                            Text("Use system settings")
                        }
                    )
                    .onChange(of: systemThemeEnable, perform: { _ in
                        SystemThemeManager.shared.handleTheme(
                            darkMode: darkModeEnable,
                            system: systemThemeEnable
                        )
                    })
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
                .foregroundColor(Theme.textColor)
                .font(.system(size: 14, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(darkModeEnable: .constant(false), systemThemeEnable: .constant(false))
}
