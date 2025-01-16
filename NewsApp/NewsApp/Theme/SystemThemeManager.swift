//
//  SystemThemeManager.swift
//  NewsApp
//
//  Created by Jhonata Jackson on 16/01/25.
//

import Foundation
import UIKit

class SystemThemeManager {
    
    static let shared = SystemThemeManager()
    
    private init() {}
    
    func handleTheme(darkMode: Bool) {
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
}
