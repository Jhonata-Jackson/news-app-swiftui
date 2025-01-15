//
//  ContentView.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 14/01/25.
//

import SwiftUI

struct HomeView: View {
        
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Feed")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    HomeView()
}
