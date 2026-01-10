//
//  OnboardingCompletedView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 03/01/2026.
//

import SwiftUI

struct OnboardingCompletedView: View {
    
    @State private var isCompletingProfileSetup: Bool = false
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack(spacing: 32) {
            header
                .padding(.top, 16)
            
            description
            
            summaryCard
            
            Spacer()
            
            AsyncButton(isLoading: isCompletingProfileSetup, title: "Start tracking", systemImage: "checkmark") {
                onFinishButtonPressed()
            }
        }
        .padding(16)
        .appScreenBackground()
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        Text("All set")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(.primaryText)
            .multilineTextAlignment(.center)
    }

    private var description: some View {
        Text("Here’s a quick summary before you start")
            .font(.system(size: 16, weight: .medium, design: .rounded))
            .foregroundStyle(.secondaryText)
            .multilineTextAlignment(.center)
    }
    
    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            summaryRow(icon: "flame.fill", title: "Daily calories", value: "\(1350) kcal")
            summaryRow(icon: "bolt.heart.fill", title: "Daily protein", value: "\(100) g")
            summaryRow(icon: "fork.knife", title: "Snacks", value: true ? "Enabled" : "Off")
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
    
    private func summaryRow(icon: String, title: String, value: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.theme.primary)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.secondaryText)
                Text(value)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundStyle(.primaryText)
            }

            Spacer()
        }
    }
    
    func onFinishButtonPressed() {
        isCompletingProfileSetup = true
        // TODO: Add logic to complete onboarding
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTabBarView: true)
        }
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
