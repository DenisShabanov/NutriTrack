//
//  Color.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 25.08.2025.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

class ColorTheme {
    let accent = Color("AccentColor")
    let gradientOne = Color("AppBackgroundGradientOne")
    let gradientTwo = Color("AppBackgroundGradientSecond")
    let blueBackground = Color("AppBlueBackground")
    let blue = Color("AppBlueColor")
    let greenBackground = Color("AppGreenBackground")
    let green = Color("AppGreenColor")
    let yellowBackground = Color("AppYellowBackground")
    let yellow = Color("AppYellowColor")
    let secondaryTextColor = Color("SecondaryTextColor")
    let cardBackground = Color("CardBackgroundColor")
}
