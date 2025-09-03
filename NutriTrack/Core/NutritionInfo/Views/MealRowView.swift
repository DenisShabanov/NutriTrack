//
//  MealRowView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 28.08.2025.
//

import SwiftUI

struct MealRowView: View {
    
    // MARK: - State
    
    @State
    var title: String
    
    // MARK: - Properties
    
    var foreground: Color = Color.theme.blue
    var background: Color = Color.theme.blueBackground
    var subTitle: String
    var caloriesCount: Int
    
    // MARK: - Body
    
    var body: some View {
        NavigationLink(destination: AddAndInfoFoodView(buttonMealTitle: $title)) {
            mealRow
        }
        
    }
}

// MARK: - Preview

#Preview {
    MealRowView(title: "Breakfast", subTitle: "Oatmeal with berries", caloriesCount: 320)
}

//MARK: - Extensions(SubViews)
extension MealRowView {
    private var mealRow: some View {
        HStack {
            Image(systemName: "sun.min")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(foreground)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(background)
                )
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
                Text(subTitle.isEmpty ? "Add meal" : subTitle)
                    .font(.callout)
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(caloriesCount)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
                Text("calories")
                    .font(.callout)
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cardModifier()
    }
}
