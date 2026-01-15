//
//  TodayView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 01/01/2026.
//

import SwiftUI

struct TodayView: View {
    
    let state: TodayDashboard
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    header
                    
                    summaryCard
                    
                    quickActions
                    
                    mealsSection
                    
                    if let insight = state.insight {
                        insightCard(insight)
                    }
                }
                .padding(16)
            }
        }
    }
    
    private var header: some View {
        HStack {
            VStack {
                Text("Today")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                
                Text(state.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Daily Summary")
                .font(.system(size: 16, weight: .semibold, design: .rounded))
            
            metricRow(
                title: "Calories",
                current: state.totals.calories,
                target: state.targets.calories,
                remaining: state.remainingCalories,
                progress: state.caloriesProgress
            )
            
            Divider()
            
            metricRow(
                title: "Protein",
                current: state.totals.proteinGrams,
                target: state.targets.proteinGrams,
                remaining: state.remainingProtein,
                progress: state.proteinProgress
            )
        }
        .padding(16)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(.separator.opacity(0.25))
        }
    }
    
    private func metricRow(title: String, current: Int, target: Int, remaining: Int, progress: Double, unit: String = "") -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                
                Spacer()
                
                Text("\(current)\(unit) / \(target)\(unit)")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.secondary)
            }
            
            ProgressView(value: progress)
            
            Text("Remaining: \(remaining)\(unit)")
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundStyle(.secondary)
        }
    }
    
    private var quickActions: some View {
        HStack(spacing: 10) {
            Button {
                // TODO: Navigate to Add Meal flow
            } label: {
                Label("Add meal", systemImage: "plus.circle.fill")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                // TODO: Quick add
            } label: {
                Image(systemName: "bolt.fill")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.bordered)
        }
    }
    
    private var mealsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Meals")
                .font(.system(size: 16, weight: .semibold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 12) {
                ForEach(state.meals) { meal in
                    mealCard(meal)
                }
            }
        }
    }
    
    private func mealCard(_ meal: MealSummary) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: meal.type.systemImage)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 28)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(meal.type.rawValue)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                    
                    Text("\(meal.totals.calories) cal • \(meal.totals.proteinGrams)g protein")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Button {
                    // TODO: add item to specific meal
                } label: {
                    Text("Add")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                }
                .buttonStyle(.borderless)
                
                if meal.items.isEmpty {
                    Text("No items yet")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundStyle(.secondary)
                        .padding(.leading, 38)
                } else {
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(meal.previewItems) { item in
                            HStack {
                                Text(item.name)
                                    .font(.system(size: 13, weight: .medium, design: .rounded))
                                Spacer()
                                Text("\(item.calories) • \(item.proteinGrams)g")
                                    .font(.system(size: 12, weight: .medium, design: .rounded))
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.leading, 38)
                }
            }
            .padding(14)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(.separator.opacity(0.25))
            )
        }
    }
    
    private func insightCard(_ insight: InsightBanner) -> some View {
        HStack(spacing: 10) {
            Image(systemName: insight.systemImage)
                .font(.system(size: 16, weight: .semibold))
            Text(insight.text)
                .font(.system(size: 13, weight: .semibold, design: .rounded))
            Spacer()
        }
        .padding(14)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(.separator.opacity(0.25))
        )
    }
}

#Preview {
    NavigationStack {
        TodayView(state: TodayDashboardMock.sample())
    }
}
