//
//  SettingsView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var darkModeEnable: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display")) {
                    Toggle(
                        isOn: $darkModeEnable,
                        label: {
                            Text("Dark Mode")
                        }
                    )
                    .onChange(of: darkModeEnable, perform: { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnable)
                    })
                }
                
                Section(header: Text("Contacts").font(
                    .system(size: 12))
                    .foregroundColor(.gray)
                ) {
                    Link(destination: URL(string: Constants.twitter)!,
                         label: {
                            Label("Follow me on twitter", systemImage: "link")
                    })
                    
                    Link(destination: URL(string: Constants.email)!,
                         label: {
                            Label("Contact me via email", systemImage: "envelope")
                    })
                    
                    Link(destination: URL(string: Constants.phone)!,
                         label: {
                            Label("Call me", systemImage: "phone")
                    })
                }
                .foregroundColor(Theme.textColor)
                .font(.system(size: 14, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(darkModeEnable: .constant(false))
}
