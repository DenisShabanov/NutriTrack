//
//  HomeView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 25.08.2025.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - State
    @State
    private var selectTab: Tabs = .home
    
    //MARK: - Options
    private var titleOptions: HeaderBarOptions {
        switch selectTab {
        case .home: .home
        case .recipe: .recipe
        case .progress: .progress
        case .settings: .settings
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradient()
                    .ignoresSafeArea()
                VStack {
                    HeaderBar(option: titleOptions, action: {})
                    contentOption
                    Spacer()
                    BottomNavigation(selectTab: $selectTab)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview("Light Mode") {
    HomeView()
}

#Preview("Dark Mode") {
    HomeView()
        .preferredColorScheme(.dark)
}

//MARK: - Extension(SunViews)
extension HomeView {
    
    private var contentOption: some View {
        ZStack {
            switch selectTab {
            case .home:
                NutritionInfoView()
                    .transition(.move(edge: .leading).combined(with: .opacity))
            case .recipe:
                Text("Recipes")
                    .transition(.move(edge: .leading).combined(with: .opacity))
                
            case .progress:
                Text("prog")
                    .transition(.move(edge: .leading).combined(with: .opacity))
            case .settings:
                Text("set")
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selectTab)
    }
    
}
