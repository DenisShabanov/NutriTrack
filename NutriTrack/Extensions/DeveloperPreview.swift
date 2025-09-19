//
//  DeveloperPreview.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 16.09.2025.
//

import Foundation

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let viewSearchVM = SearchFoodViewModel()
    
    private init() {}
    
    let product = FoodItem(
        code: "2393697009721",
        imageSmallURL: "https://images.openfoodfacts.org/images/products/239/369/700/9721/front_ru.3.200.jpg",
        nutriments: Nutriments(
            carbohydrates100G: 0,
            energyKcal100G: 140,
            energyKj100G: 586,
            fat100G: 8,
            proteins100G: 18),
        productName: "Куриное филе бедра без кожи",
        productNameRu: "Куриное филе бедра без кожи")
}
