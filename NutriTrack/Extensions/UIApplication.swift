//
//  UIApplication.swift
//  NutriTrack
//
//  Created by Denis Shabanov on 30.08.2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
