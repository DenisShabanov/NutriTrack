//
//  ProgressBar.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 27.08.2025.
//

import SwiftUI

struct ProgressBar: View {
    
    //MARK: - Properties
    var value: Double
    var total: Double
    var height: CGFloat = 20
    var tint: Color = Color.theme.blue
    var background: Color = Color.theme.blueBackground
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(background)
                Capsule()
                    .fill(tint)
                    .frame(width: geo.size.width * CGFloat(value / total))
            }
        }
        .frame(height: height)
    }
}

#Preview {
    ProgressBar(value: 100, total: 2000)
}
