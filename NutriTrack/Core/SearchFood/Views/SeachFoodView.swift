//
//  SeachFoodView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 30.08.2025.
//

import SwiftUI

struct SearchFoodView: View {
    //MARK: Enviropment
    @Environment(SearchFoodViewModel.self)
    private var vm
    
    //MARK: - Body
    var body: some View {
        ZStack {
            BackgroundGradient()
            VStack {
                SearchBarView(searchText: Binding(
                    get: { vm.searchText },
                    set: { vm.searchText = $0 }),
                    action: {
                        vm.search(query: vm.searchText)
                    }
                )
                searchProductList
            }
        }
    }
}

#Preview("Light Mode") {
    SearchFoodView()
        .environment(DeveloperPreview.instance.viewSearchVM)
}
#Preview("Dark Mode") {
    SearchFoodView()
        .preferredColorScheme(.dark)
        .environment(DeveloperPreview.instance.viewSearchVM)
}

//MARK: SubViews
extension SearchFoodView {
    
    private var searchProductList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(vm.searchProduct, id: \.code) { item in
                    FoodRowView(product: item)
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding()
    }
    
}
