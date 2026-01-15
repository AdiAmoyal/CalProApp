//
//  MealType.swift
//  CalProApp
//
//  Created by Adi Amoyal on 15/01/2026.
//

import SwiftUI

enum MealType: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snacks = "Snacks"
    
    var id: String { rawValue }
    
    var systemImage: String {
        switch self {
        case .breakfast: "sunrise"
        case .lunch: "sun.max"
        case .dinner: "moon.stars"
        case .snacks: "sparkles"
        }
    }
}
