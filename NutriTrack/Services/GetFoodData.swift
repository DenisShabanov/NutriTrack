//
//  GetFoodData.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 16.09.2025.
//

import Foundation
import Combine

class GetFoodData {
    //MARK: Properties
    @Published var productInfo: [FoodItem] = []
    var foodInfoSubscription: AnyCancellable?
    
    
    //MARK: Get data func
    func getSearchResults(query: String) {
        guard let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://world.openfoodfacts.org/cgi/search.pl?search_terms=\(queryEncoded)&search_simple=1&action=process&json=1")
        else { return }
        
        foodInfoSubscription = NetworkingManager.download(url: url)
            .decode(type: SearchProductData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] (returnedFoodInfo) in
                self?.productInfo = returnedFoodInfo.products
                self?.foodInfoSubscription?.cancel()
            })
    }
}
