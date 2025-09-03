//
//  AddAndInfoFoodView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 28.08.2025.
//

import SwiftUI

struct AddAndInfoFoodView: View {
    //MARK: - Environment
    @Environment(\.dismiss)
    var dismiss
    
    //MARK: - Binding
    @Binding
    var buttonMealTitle: String
    
    // MARK: - Body
    var body: some View {
        ZStack {
            //background
            BackgroundGradient()
                .ignoresSafeArea()
            //foreground
            VStack(spacing: 20) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        header
                        eatInfoCard
                        Text("Portion")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.theme.accent)
                        portionSection
                        Text("Nutrition Facts")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.theme.accent)
                        nutritionFactSection
                        
                    }
                    .padding()
                }
                Divider()
                addMealButton
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview("Light Mode") {
    AddAndInfoFoodView(buttonMealTitle: .constant("Lunch"))
}

#Preview("Dark Mode") {
    AddAndInfoFoodView(buttonMealTitle: .constant("Lunch"))
        .preferredColorScheme(.dark)
}

//MARK: - Extonsion(SubViews)
extension AddAndInfoFoodView {
    
    private var header: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundStyle(Color.theme.accent)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.theme.cardBackground)
                    )
            }
            Text("Add Food")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Save")
                    .font(.headline)
                    .foregroundStyle(Color.theme.blue)
            }

        }
    }
    
    private var eatInfoCard: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Greek Salad")
                Spacer()
                Text("320 cal")
            }
            HStack {
                Text("Homemade")
                Text("Lunch")
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .cardModifier()
    }
    
    private var portionSection: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "scalemass")
                    .font(.title2)
                    .foregroundStyle(Color.theme.blue)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.theme.blueBackground)
                    )
                VStack(alignment: .leading) {
                    Text("Serving Size")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.theme.accent)
                    Text("1 bowl (250g)")
                        .font(.callout)
                        .foregroundStyle(Color.theme.secondaryTextColor)
                }
                Spacer()
                
                CircleButton(icon: "minus", background: Color.gray.opacity(0.2), foreground: Color.theme.accent, action: {})
                Text("1")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
                    .padding(.horizontal, 4)
                CircleButton(icon: "plus", background: Color.blue, foreground: Color.theme.accent, action: {})
            }
            HStack {
                Button {
                    
                } label: {
                    Text("Change serving size")
                        .font(.headline)
                        .foregroundStyle(Color.theme.blue)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Custom amount")
                        .font(.headline)
                        .foregroundStyle(Color.theme.blue)
                }

            }
            
        }
        .padding()
        .cardModifier()
    }
    
    private var nutritionFactSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                NutritionFactsCard(icon: "scalemass", count: 12, foregroundIcon: Color.theme.blue, backgroundIcon: Color.theme.blueBackground, nutriName: "Protein")
                Spacer()
                NutritionFactsCard(icon: "checkmark.seal", count: 12, foregroundIcon: Color.theme.green, backgroundIcon: Color.theme.greenBackground, nutriName: "Carbs")
                Spacer()
            }
            HStack {
                NutritionFactsCard(icon: "drop", count: 12, foregroundIcon: Color.theme.yellow, backgroundIcon: Color.theme.yellowBackground, nutriName: "Fat")
            }
        }
        .padding()
        .cardModifier()
    }
    
    private var addMealButton: some View {
        Button {
            
        } label: {
            Text("+ Add to Today's \(buttonMealTitle)")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.theme.accent)
                .frame(maxWidth: .infinity, minHeight: 55)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.theme.blue)
                )
                .padding(.horizontal)
                .ignoresSafeArea()
        }
    }
    
}
