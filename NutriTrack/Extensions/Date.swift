//
//  Date.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 24.09.2025.
//

import Foundation

extension Date {
    
    private var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return formatter
    }
    
    func dateToString() -> String {
        return dateFormat.string(from: self)
    }
    
}
