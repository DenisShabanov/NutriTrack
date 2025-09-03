//
//  CircleButton.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 29.08.2025.
//

import SwiftUI

struct CircleButton: View {
    
    //MARK: - Properties
    let icon: String
    let background: Color
    let foreground: Color
    let action: () -> Void
    
    //MARK: - Body
    var body: some View {
        Button {
          action()
        } label: {
            Circle()
                .fill(background)
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: icon)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundStyle(foreground)
                }
        }
    }
}

#Preview {
    CircleButton(icon: "person",background: Color.theme.blueBackground, foreground: Color.theme.blue, action: {})
}
