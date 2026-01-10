//
//  OnboardingIntroView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 10/01/2026.
//

import SwiftUI

struct OnboardingIntroView: View {
    
    var body: some View {
        VStack(spacing: 32) {
            header
                .padding(.top, 32)
            
            Capsule()
                .fill(Color.theme.primary.opacity(0.6))
                .frame(width: 48, height: 4)
            
            description
            
            bulletSection
                .padding(.top, 8)
            
            Spacer()
            
            PrimaryNavigationButton(title: "Continue", systemImage: "arrow.right", destination: TargetsView())
        }
        .padding(16)
        .appScreenBackground()
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        Text("Simple. Consistent. Effective.")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(.primaryText)
            .multilineTextAlignment(.center)
    }
    
    private var description: some View {
        Text("""
This app helps you stay consistent —
not perfect.

Set daily calorie and protein targets,
log your meals, and let the app do the rest.
""")
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundStyle(.secondaryText)
        .multilineTextAlignment(.center)
    }
    
    private var bulletSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            introBullet(icon: "target", text: "Focus on daily goals")
            introBullet(icon: "fork.knife", text: "Log meals your way")
            introBullet(icon: "chart.line.uptrend.xyaxis", text: "See progress at a glance")
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    @ViewBuilder
    private func introBullet(icon: String, text: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color.theme.primary)
                .frame(width: 32)
            
            Text(text)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundStyle(.primaryText)
        }
    }
}

#Preview {
    OnboardingIntroView()
}
