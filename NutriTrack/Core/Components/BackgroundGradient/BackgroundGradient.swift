//
//  BackgroundGradient.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 29.08.2025.
//

import SwiftUI

struct BackgroundGradient: View {
    
    //MARK: - Body
    var body: some View {
        LinearGradient(colors: [Color.theme.gradientOne,Color.theme.gradientTwo], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradient()
}
