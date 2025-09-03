//
//  NutriTrackApp.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 25.08.2025.
//

import SwiftUI

@main
struct NutriTrackApp: App {
    
    //MARK: - App Storage
    
    @AppStorage("dark_mode")
    private var darkMode: Bool = false
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
}
