//
//  ContentView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled: Bool = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled: Bool = false
        
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Feed")
                }
            SettingsView(darkModeEnable: $darkModeEnabled,
                         systemThemeEnable: $systemThemeEnabled)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .onAppear {
            SystemThemeManager.shared.handleTheme(
                darkMode: darkModeEnabled,
                system: systemThemeEnabled
            )
        }
    }
}

#Preview {
    HomeView()
}
