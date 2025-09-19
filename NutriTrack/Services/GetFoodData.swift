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
    var infoSubscription: AnyCancellable?
    
    
    //MARK: Get data func
    func getSearchResults(query: String) {
        guard let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://world.openfoodfacts.org/cgi/search.pl?search_terms=\(queryEncoded)&search_simple=1&action=process&json=1")
        else { return }
        
        infoSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let responce = output.response as? HTTPURLResponse,
                      responce.statusCode >= 200 && responce.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: SearchProductData.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedProduct) in
                self?.productInfo = returnedProduct.products
                self?.infoSubscription?.cancel()
            }
    }
}
