//
//  FoodRowView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 30.08.2025.
//

import SwiftUI

struct FoodRowView: View {
    
    //MARK: Properties
    var product: FoodItem
    
    //MARK: - Body
    var body: some View {
        productRow
    }
}

#Preview {
    FoodRowView(product: DeveloperPreview.instance.product)
}


//MARK: SubViews
extension FoodRowView {
    
    private var productRow: some View {
        HStack {
            Text(product.productName ?? "")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
            Spacer()
            Text("\(product.nutriments.energyKcal100G?.asNutrinetsWith0Decimals() ?? "0") kcal")
                .font(.callout)
                .foregroundStyle(Color.theme.secondaryTextColor)
            Image(systemName: "chevron.right")
                .font(.callout)
                .foregroundStyle(Color.theme.secondaryTextColor)
        }
        .padding()
        .cardModifier()
        .onTapGesture {
            
        }
    }
    
}
