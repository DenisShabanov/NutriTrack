//
//  SearchBarView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 30.08.2025.
//

import SwiftUI

struct SearchBarView: View {
    
    //MARK: - Binding
    @Binding
    var searchText: String
    
    //MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.theme.secondaryTextColor : Color.theme.accent
                )
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
        .font(.headline)
        .padding()
        .cardModifier()
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
