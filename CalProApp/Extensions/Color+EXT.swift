//
//  Color+EXT.swift
//  CalProApp
//
//  Created by Adi Amoyal on 04/01/2026.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let primary = Color("AccentColor")
    let primaryDark = Color("GreenDark")
    let primaryLight = Color("GreenLight")
    
    let background = Color("Background")
    
    let textPrimary = Color("PrimaryText")
    let textSecondary = Color("SecondaryText")
    
    let warning = Color("Warning")
    let error = Color("Error")
    let success = Color("Success")
}
