//
//  SeachFoodView.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 30.08.2025.
//

import SwiftUI

struct SeachFoodView: View {
    
    //MARK: - State
    @State
    var textField: String
    
    //MARK: - Body
    var body: some View {
        ZStack {
            //background
            BackgroundGradient()
            //foreground
            VStack {
                SearchBarView(searchText: $textField)
                ScrollView {
                    
                }
            }
        }
    }
}

#Preview("Light Mode") {
    SeachFoodView(textField: "")
}
#Preview("Dark Mode") {
    SeachFoodView(textField: "")
        .preferredColorScheme(.dark)
}
