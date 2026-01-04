//
//  WelcomeView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 01/01/2026.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer(minLength: 28)
                
                headerSection
                
                Spacer()
                
                featuresSection
                
                Spacer()
                
                buttonsSection
            }
            .padding(.horizontal, 16)
            .appScreenBackground(.welcome)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 18) {
            AppMark()
                .padding(.bottom, 4)
            
            VStack(spacing: 10) {
                Text("Track calories & protein")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.theme.textPrimary)
                    .multilineTextAlignment(.center)
                
                Text("Set daily targets, log meals fast, and stay consistent—without the noise.")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundStyle(Color.theme.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 22)
            }
        }
    }
    
    private var featuresSection: some View {
        VStack(spacing: 16) {
            FeatureCard(icon: "flame.fill", title: "Daily goals", subtitle: "Calories + protein targets")
            
            FeatureCard(icon: "fork.knife", title: "Simple logging", subtitle: "Meals that match your routine")
            
            FeatureCard(icon: "chart.line.uptrend.xyaxis", title: "Progress", subtitle: "See your day at a glance")
        }
    }
    
    private var buttonsSection: some View {
        VStack(spacing: 16) {
            PrimaryNavigationButton(title: "Let’s start", systemImage: "arrow.right", destination: OnboardingCompletedView())
            
            SecondaryButton(title: "Sign in to sync", systemImage: "person.crop.circle") {
                // TODO: Add logic
            }
            
            Text("No account needed. You can sign in anytime to backup & sync.")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundStyle(Color.theme.textSecondary.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 22)
                .padding(.top, 4)
        }
    }
}

#Preview {
    WelcomeView()
}
