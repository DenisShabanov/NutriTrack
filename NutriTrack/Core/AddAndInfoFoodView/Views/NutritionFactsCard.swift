//
//  NutritionFactsCard.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 29.08.2025.
//

import SwiftUI

struct NutritionFactsCard: View {
    
    // MARK: - Properties
    let icon: String
    let count: Int
    let foregroundIcon: Color
    let backgroundIcon: Color
    let nutriName: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            nutritionRow
        }
    }
}

#Preview {
    NutritionFactsCard(icon: "scalemass", count: 12, foregroundIcon: Color.theme.blue, backgroundIcon: Color.theme.blueBackground, nutriName: "Protein")
}

//MARK: - Extensions(SubViews)
extension NutritionFactsCard {
    
    private var nutritionRow: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(foregroundIcon)
                .padding()
                .frame(width: 60, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(backgroundIcon)
                )
                
            VStack(alignment: .leading) {
                Text(nutriName)
                    .font(.callout)
                    .foregroundStyle(Color.theme.secondaryTextColor)
                Text("\(count)g")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
            }
        }
    }
}
