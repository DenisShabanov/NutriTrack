//
//  SearchFoodViewModel.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 16.09.2025.
//

import Foundation
import Combine

@Observable class SearchFoodViewModel {
    
    var searchProduct: [FoodItem] = []
    var searchText: String = ""
    
    private let getFoodData = GetFoodData()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        getFoodData.$productInfo
            .sink { [weak self] (returnedProduct) in
                self?.searchProduct = returnedProduct
            }
            .store(in: &cancellables)
    }
    
    func search(query: String) {
        getFoodData.getSearchResults(query: searchText)
    }
}
