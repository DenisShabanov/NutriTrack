//
//  SearchBarView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 30.08.2025.
//

import SwiftUI

struct SearchBarView: View {
    
    //MARK:  Binding
    @Binding
    var searchText: String
    
    //MARK: Properties
    var action: () -> Void
    
    //MARK: - Body
    var body: some View {
        HStack {
            searchButton
            textField
        }
        .font(.headline)
        .padding()
        .cardModifier()
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), action: { })
}

//MARK: SubViews
extension SearchBarView {
    
    private var searchButton: some View {
        Button {
            action()
        } label: {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.theme.secondaryTextColor : Color.theme.accent
                )
        }
    }
    
    private var textField: some View {
        TextField("Search Food...", text: $searchText)
            .foregroundStyle(Color.theme.accent)
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .overlay(
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x: 10)
                    .foregroundStyle(Color.theme.accent)
                    .opacity(searchText.isEmpty ? 0.0: 1.0)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        searchText = ""
                    }
                ,alignment: .trailing
            )
    }
    
}
