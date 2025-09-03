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
    private var titleOptions: HomeTitleOptions {
        switch selectTab {
        case .home: .home
        case .recipe: .recipes
        case .progress: .progress
        case .settings: .settings
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                //background layer
                BackgroundGradient()
                    .ignoresSafeArea()
                //content layer
                VStack {
                    homeHeader
                    
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
    
    enum HomeTitleOptions: String {
        case home = "Today"
        case recipes = "Recipes"
        case progress = "Your progress"
        case settings = "Settings"
    }
    
    private var homeHeader: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(titleOptions.rawValue)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.theme.accent)
                    Text("Monday, Aug 25")
                        .font(.headline)
                        .foregroundStyle(Color.theme.secondaryTextColor)
                }
                Spacer()
                CircleButton(icon: "person", background: Color.theme.blueBackground, foreground: Color.theme.blue, action: {})
            }
        }
    }
    
}
