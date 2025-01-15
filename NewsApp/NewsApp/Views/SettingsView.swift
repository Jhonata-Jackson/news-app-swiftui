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
                    Label("Follow me on twitter @AnotherDevBr", systemImage: "link")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .semibold))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
