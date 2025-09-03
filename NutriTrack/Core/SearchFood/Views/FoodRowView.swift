//
//  FoodRowView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 30.08.2025.
//

import SwiftUI

struct FoodRowView: View {
    
    //MARK: - Body
    var body: some View {
        HStack {
            Text("Tomato soup")
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            Text("220 ckal")
                .font(.callout)
                .foregroundStyle(Color.theme.secondaryTextColor)
        }
        .padding()
        .cardModifier()
    }
}

#Preview {
    FoodRowView()
}
