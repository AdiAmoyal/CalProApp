//
//  MealSummary.swift
//  CalProApp
//
//  Created by Adi Amoyal on 15/01/2026.
//

import SwiftUI

struct MealSummary: Identifiable, Equatable {
    let id: UUID
    var type: MealType
    var items: [FoodItem]
    
    init(id: UUID = UUID(), type: MealType, items: [FoodItem]) {
        self.id = id
        self.type = type
        self.items = items
    }
    
    var totals: DailyNutritionTotals {
        let calories = items.reduce(0) { $0 + $1.calories }
        let protein = items.reduce(0) { $0 + $1.proteinGrams }
        return DailyNutritionTotals(calories: calories, proteinGrams: protein)
    }
    
    var previewItems: ArraySlice<FoodItem> { items.prefix(3) }
}
