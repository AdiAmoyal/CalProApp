//
//  FoodItem.swift
//  CalProApp
//
//  Created by Adi Amoyal on 15/01/2026.
//

import SwiftUI

struct FoodItem: Identifiable, Equatable {
    let id: UUID
    let name: String
    let calories: Int
    let proteinGrams: Int
    
    init(id: UUID = UUID(), name: String, calories: Int, proteinGrams: Int) {
        self.id = id
        self.name = name
        self.calories = calories
        self.proteinGrams = proteinGrams
    }
}
