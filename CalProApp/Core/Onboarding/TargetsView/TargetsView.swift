//
//  TargetsView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 10/01/2026.
//

import SwiftUI

struct TargetsView: View {
    
    @State private var dailyCalories: Int = 0
    @State private var dailyProtein: Int = 0
    
    @FocusState private var focusedField: Field?
    enum Field { case calories, protein }
    
    var body: some View {
        VStack(spacing: 32) {
            header
                .padding(.top, 16)
            
            description
            
            targetsCard
            
            quickPicks
            
            Spacer()
            
            PrimaryNavigationButton(title: "Continue", systemImage: "arrow.right", destination: OnboardingMealsView())
        }
        .padding(16)
        .appScreenBackground()
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        Text("Set your daily targets")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(.primaryText)
            .multilineTextAlignment(.center)
    }
    
    private var description: some View {
        Text("Choose your daily calorie and protein goals. You can change them anytime later.")
            .font(.system(size: 16, weight: .medium, design: .rounded))
            .foregroundStyle(.secondaryText)
            .multilineTextAlignment(.center)
    }
    
    private var targetsCard: some View {
        VStack(spacing: 16) {
            targetRow(
                title: "Calories",
                icon: "flame.fill",
                value: $dailyCalories,
                placeholder: "1800",
                suffix: "kcal"
            )
            .focused($focusedField, equals: .calories)
            
            Divider().opacity(0.5)
            
            targetRow(
                title: "Protein",
                icon: "bolt.heart.fill",
                value: $dailyProtein,
                placeholder: "120",
                suffix: "g"
            )
            .focused($focusedField, equals: .protein)
        }
        .padding(16)
    }
    
    @ViewBuilder
    private func targetRow(title: String, icon: String, value: Binding<Int>, placeholder: String, suffix: String
    ) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.theme.primary.opacity(0.15))
                    .frame(width: 36, height: 36)

                Image(systemName: icon)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.theme.primary)
            }
            
            Text(title)
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundStyle(.primaryText)
            
            HStack(spacing: 6) {
                TextField(
                    placeholder,
                    text: Binding(
                        get: { String(value.wrappedValue) },
                        set: { value.wrappedValue = Int($0.filter(\.isNumber)) ?? value.wrappedValue }
                    )
                )
                .padding(.leading, 4)
                .keyboardType(.numberPad)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(.primaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.theme.primary.opacity(0.15))
                )

                Text(suffix)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.secondaryText)
            }
        }
    }
    
    private var quickPicks: some View {
        VStack(spacing: 12) {
            Text("Quick picks")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundStyle(.secondaryText)
                .frame(maxWidth: .infinity, alignment: .leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    pickChip("1700 / 110g") { apply(cal: 1700, pro: 110) }
                    pickChip("1800 / 120g") { apply(cal: 1800, pro: 120) }
                    pickChip("2000 / 140g") { apply(cal: 2000, pro: 140) }
                }
                .padding(.vertical, 2)
            }
        }
    }
    
    private func pickChip(_ title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundStyle(.primaryText)
                .padding(.vertical, 10)
                .padding(.horizontal, 14)
                .background(
                    Capsule()
                        .fill(Color.theme.primary.opacity(0.10))
                        .overlay(Capsule().strokeBorder(Color.theme.primary.opacity(0.14), lineWidth: 1))
                )
        }
        .buttonStyle(.plain)
    }
    
    private func apply(cal: Int, pro: Int) {
        dailyCalories = cal
        dailyProtein = pro
        focusedField = nil
    }
}

#Preview {
    TargetsView()
}
