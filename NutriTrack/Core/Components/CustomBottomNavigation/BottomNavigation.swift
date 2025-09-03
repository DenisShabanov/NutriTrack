//
//  BottomNavigation.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 25.08.2025.
//

import SwiftUI

//MARK: - Enum
enum Tabs: Int, CaseIterable {
    case home
    case recipe
    case progress
    case settings
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .recipe: return "list.clipboard"
        case .progress: return "chart.bar"
        case .settings: return "gearshape"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .recipe: return "Recipes"
        case .progress: return "Progress"
        case .settings: return "Settings"
        }
    }
}

struct BottomNavigation: View {
    
    //MARK: - Binding
    @Binding var selectTab: Tabs
    
    //MARK: - Body
    var body: some View {
        HStack {
            ForEach(Tabs.allCases, id: \.self) { tab in
                Spacer()
                TabButton(
                    icon: tab.icon,
                    title: tab.title,
                    isSelected: selectTab == tab
                ) {
                    selectTab = tab
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
    }
}


struct TabButton: View {
    
    //MARK: - Properties
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    //MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 2) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
                    .foregroundStyle(isSelected ? Color.theme.blue : Color.theme.secondaryTextColor)
                    .fontWeight(.semibold)
                    .padding(2)
                Text(title)
                    .foregroundStyle(isSelected ? Color.theme.accent : Color.theme.secondaryTextColor)
                    .font(.caption)
            }
            .frame(height: 30)
        }
    }
}

#Preview {
    BottomNavigation(selectTab: .constant(.home))
}
