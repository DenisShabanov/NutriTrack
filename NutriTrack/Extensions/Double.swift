//
//  Double.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 19.09.2025.
//

import Foundation

extension Double {
    
    private var nutrientFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        return formatter
    }
    
    func asNutrinetsWith0Decimals() -> String {
        let number = NSNumber(value: self)
        return nutrientFormatter2.string(from: number) ?? "0"
    }
    
}
