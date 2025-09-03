//
//  MacronutrientsView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 27.08.2025.
//

import SwiftUI

struct MacronutrientsView: View {
    
    let nutrient: String
    let consumed: Int
    let goal: Int
    var tint: Color = Color.theme.blue
    var background: Color = Color.theme.blueBackground
    
    private var bar: ProgressBar
    
    init(nutrient: String, consumed: Int, goal: Int, tint: Color, background: Color) {
        self.nutrient = nutrient
        self.consumed = consumed
        self.goal = goal
        self.tint = tint
        self.background = background
        self.bar = ProgressBar(value: Double(consumed), total: Double(goal), height: 8, tint: tint, background: background)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            bar
                .padding(.bottom, 4)
            Text(nutrient)
                .foregroundStyle(Color.theme.secondaryTextColor)
                .padding(.bottom, 4)
            Text("\(consumed)g")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.theme.accent)
            Text("\(goal)g Goal")
                .font(.callout)
                .foregroundStyle(Color.theme.secondaryTextColor)
        }
        .padding()
        .frame(height: 160)
        .cardModifier()
    }
}

#Preview {
    MacronutrientsView(nutrient: "Protein", consumed: 78, goal: 120, tint: Color.theme.blue, background: Color.theme.blueBackground)
}
