//
//  DailyNutritionTotals.swift
//  CalProApp
//
//  Created by Adi Amoyal on 15/01/2026.
//

import SwiftUI

struct DailyNutritionTotals: Equatable {
    var calories: Int
    var proteinGrams: Int
    
    static let zero = DailyNutritionTotals(calories: 0, proteinGrams: 0)
}
