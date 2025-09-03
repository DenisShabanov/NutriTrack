//
//  CardModifier.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 27.08.2025.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.theme.cardBackground)
                    .shadow(color: Color.theme.accent.opacity(0.05), radius: 4, x: 0, y: 2)
            )
    }
}

extension View {
    func cardModifier() -> some View {
        self.modifier(CardModifier())
    }
}

