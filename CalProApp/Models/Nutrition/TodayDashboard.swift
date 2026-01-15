//
//  TodayDashboard.swift
//  CalProApp
//
//  Created by Adi Amoyal on 15/01/2026.
//

import SwiftUI
import Foundation

public typealias TodayDashboardMock = TodayDashboard.MockTodayData

public struct TodayDashboard: Equatable {
    var date: Date
    var targets: DailyNutritionTargets
    var totals: DailyNutritionTotals
    var meals: [MealSummary]
    var insight: InsightBanner?
    
    var remainingCalories: Int { max(targets.calories - totals.calories, 0) }
    var remainingProtein: Int { max(targets.proteinGrams - totals.proteinGrams, 0) }
    
    var caloriesProgress: Double {
        guard targets.calories > 0 else { return 0 }
        return min(Double(totals.calories) / Double(targets.calories), 1)
    }
    
    var proteinProgress: Double {
        guard targets.proteinGrams > 0 else { return 0 }
        return min(Double(totals.proteinGrams) / Double(targets.proteinGrams), 1)
    }
}

extension TodayDashboard {
    
    public enum MockTodayData {
        static func sample() -> TodayDashboard {
            let breakfast = MealSummary(type: .breakfast, items: [
                FoodItem(name: "Protein shake", calories: 180, proteinGrams: 30),
                FoodItem(name: "Cottage cheese", calories: 220, proteinGrams: 22)
            ])
            
            let lunch = MealSummary(type: .lunch, items: [
                FoodItem(name: "Chicken breast (150g)", calories: 250, proteinGrams: 40),
                FoodItem(name: "White rice (100g)", calories: 130, proteinGrams: 3)
            ])
            
            let dinner = MealSummary(type: .dinner, items: [])
            
            let snacks = MealSummary(type: .snacks, items: [
                FoodItem(name: "Yogurt (178g)", calories: 160, proteinGrams: 17)
            ])
            
            let meals = [breakfast, lunch, dinner, snacks]
            let totals = meals.map(\.totals).reduce(.zero) { acc, next in
                DailyNutritionTotals(calories: acc.calories + next.calories,
                            proteinGrams: acc.proteinGrams + next.proteinGrams)
            }
            
            let targets = DailyNutritionTargets(calories: 1800, proteinGrams: 130)
            let insight = InsightBanner(
                text: "You’re \(max(targets.proteinGrams - totals.proteinGrams, 0))g protein away from your target 💪",
                systemImage: "bolt.heart"
            )
            
            return TodayDashboard(
                date: .now,
                targets: targets,
                totals: totals,
                meals: meals,
                insight: insight
            )
        }
    }
}
