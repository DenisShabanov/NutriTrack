//
//  NutritionInfoView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 27.08.2025.
//

import SwiftUI

struct NutritionInfoView: View {
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20){
                caloriesGoalCard
                Text("Macronutrients")
                    .foregroundStyle(Color.theme.accent)
                    .font(.title2)
                    .fontWeight(.semibold)
                macronutrientsCards
                Text("Today's Meals")
                    .foregroundStyle(Color.theme.accent)
                    .font(.title2)
                    .fontWeight(.semibold)
                mealRows
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NutritionInfoView()
}

//MARK: - Extensions(SubViews)
extension NutritionInfoView {
    
    private var caloriesGoalCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Calories")
                    .foregroundStyle(Color.theme.accent)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Text("Daily Goal: 2,000")
                    .font(.callout)
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
            HStack(alignment: .center) {
                Text("1,450")
                    .foregroundStyle(Color.theme.accent)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.trailing)
                Text("calories consumed")
                    .font(.callout)
                    .foregroundStyle(Color.theme.secondaryTextColor)
            }
            ProgressBar(value: 1450, total: 2000, height: 15, tint: Color.theme.blue, background: Color.gray.opacity(0.3))
            HStack {
                Text("0")
                Spacer()
                Text("550 calories remaining")
            }
            .font(.callout)
            .foregroundStyle(Color.theme.secondaryTextColor)
            
        }
        .padding()
        .cardModifier()
    }
    
    private var macronutrientsCards: some View {
        LazyVGrid(columns: columns) {
            MacronutrientsView( nutrient: "Protein", consumed: 78, goal: 120, tint: Color.theme.blue, background: Color.theme.blueBackground)
            MacronutrientsView( nutrient: "Carbs", consumed: 113, goal: 250, tint: Color.theme.green, background: Color.theme.greenBackground)
            MacronutrientsView( nutrient: "Fat", consumed: 48, goal: 60, tint: Color.theme.yellow, background: Color.theme.yellowBackground)
        }
    }
    
    private var mealRows: some View {
        VStack {
            MealRowView(title: "Breakfast", foreground: Color.theme.blue, background: Color.theme.blueBackground, subTitle: "Oatmeal with berries", caloriesCount: 320)
            MealRowView(title: "Lunch", foreground: Color.theme.green, background: Color.theme.greenBackground, subTitle: "Grilled chicken salad", caloriesCount: 450)
            MealRowView(title: "Dinner", foreground: Color.theme.yellow, background: Color.theme.yellowBackground, subTitle: "Salad", caloriesCount: 150)
        }
    }
}
