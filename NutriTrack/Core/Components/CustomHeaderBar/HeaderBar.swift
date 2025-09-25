//
//  HeaderBar.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 24.09.2025.
//

import SwiftUI

//MARK: Enum
enum HeaderBarOptions {
    case home
    case recipe
    case progress
    case settings
    
    var title: String {
        switch self {
        case .home: return "Today"
        case .recipe: return "Recipes"
        case .progress: return "Weight"
        case .settings: return "Settings"
        }
    }
    
    var subTitle: String {
        switch self {
        case .home: return Date().dateToString()
        case .recipe: return "Create your rescipes"
        case .progress: return "Track your progress"
        case .settings: return "Your profile"
        }
    }
    var icon: String {
        switch self {
        case .home: return "person"
        case .recipe: return "plus"
        case .progress: return "gearshape"
        case .settings: return "gearshape"
        }
    }
}


struct HeaderBar: View {
    
    //MARK: Properties
    let option: HeaderBarOptions
    let action: () -> Void
    
    //MARK: Body
    var body: some View {
       header
    }
}

#Preview {
    HeaderBar(option: .home, action: {})
}


//MARK: SubView
extension HeaderBar {
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(option.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.theme.accent)
                Text(option.subTitle)
                    .font(.headline)
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
            Spacer()
            CircleButton(icon: option.icon, background: Color.theme.blueBackground, foreground: Color.theme.blue, action: action)
        }
    }
    
}
