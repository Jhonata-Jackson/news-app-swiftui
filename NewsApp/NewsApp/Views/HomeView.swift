//
//  ContentView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled: Bool = false
        
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Feed")
                }
            SettingsView(darkModeEnable: $darkModeEnabled)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .onAppear {
            SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled)
        }
    }
}

#Preview {
    HomeView()
}
