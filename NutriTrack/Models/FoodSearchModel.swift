//
//  FoodSearchModel.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 16.09.2025.
//

import Foundation

// JSON responce
/*
 URL-https://world.openfoodfacts.org/cgi/search.pl?search_terms=%D0%BA%D1%83%D1%80%D0%B8%D0%BD%D0%BE%D0%B5%20%D1%84%D0%B8%D0%BB%D0%B5&search_simple=1&action=process&json=1
 
 JSON request
 {
   "products": [
     {
       "code": "2393697009721",
       "image_small_url": "https://images.openfoodfacts.org/images/products/239/369/700/9721/front_ru.3.200.jpg",
       "nutriments": {
         "carbohydrates_100g": 0,
         "energy-kcal_100g": 140,
         "energy-kj_100g": 586,
         "fat_100g": 8,
         "proteins_100g": 18
       },
       "product_name": "Куриное филе бедра без кожи",
       "product_name_ru": "Куриное филе бедра без кожи"
     }
     ]
 }
 */


struct SearchProductData: Codable {
    let products: [FoodItem]
}

struct FoodItem: Identifiable, Codable {
    var id: String = UUID().uuidString
    let code: String?
    let imageSmallURL: String?
    let nutriments: Nutriments
    let productName, productNameRu: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case imageSmallURL = "image_small_url"
        case nutriments
        case productName = "product_name"
        case productNameRu = "product_name_ru"
    }
}

struct Nutriments: Codable {
    let carbohydrates100G, energyKcal100G, energyKj100G, fat100G, proteins100G: Double?
    
    enum CodingKeys: String, CodingKey {
        case carbohydrates100G = "carbohydrates_100g"
        case energyKcal100G = "energy-kcal_100g"
        case energyKj100G = "energy-kj_100g"
        case fat100G = "fat_100g"
        case proteins100G = "proteins_100g"
    }
}
