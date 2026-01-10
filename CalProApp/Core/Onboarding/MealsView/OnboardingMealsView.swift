//
//  OnboardingMealsView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 10/01/2026.
//

import SwiftUI

struct OnboardingMealsView: View {
    
    @State private var includesSnacks: Bool = false
    
    var body: some View {
        VStack(spacing: 32) {
            header
                .padding(.top, 16)
            
            description
            
            mealsCard
                .padding(.top, 8)
            
            Spacer()
            
            PrimaryNavigationButton(title: "Continue", systemImage: "arrow.right", destination: OnboardingCompletedView())
        }
        .padding(16)
        .appScreenBackground()
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        Text("Your meal routine")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(.primaryText)
            .multilineTextAlignment(.center)
    }

    private var description: some View {
        Text("This only affects how your day is organized")
            .font(.system(size: 16, weight: .medium, design: .rounded))
            .foregroundStyle(.secondaryText)
            .multilineTextAlignment(.center)
    }
    
    private var mealsCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            mealRow(icon: "sunrise.fill", title: "Breakfast")
            mealRow(icon: "fork.knife", title: "Lunch")
            mealRow(icon: "moon.stars.fill", title: "Dinner")

            Divider().opacity(0.25)
            
            HStack(spacing: 12) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color.theme.primary)
                    .frame(width: 32)

                VStack(alignment: .leading, spacing: 2) {
                    Text("Add snacks")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundStyle(.primaryText)
                    Text("Enable an extra snack slot")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundStyle(.secondaryText)
                }

                Spacer()

                Toggle("", isOn: $includesSnacks)
                    .labelsHidden()
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.theme.primary.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(Color.theme.primary.opacity(0.10), lineWidth: 1)
                )
        )
    }
    
    private func mealRow(icon: String, title: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.theme.primary)
                .frame(width: 32)

            Text(title)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundStyle(.primaryText)

            Spacer()

            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(Color.theme.success)
        }
    }
}

#Preview {
    OnboardingMealsView()
}
