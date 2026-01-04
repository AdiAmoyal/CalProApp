//
//  AppScreenBackground.swift
//  CalProApp
//
//  Created by Adi Amoyal on 04/01/2026.
//

import SwiftUI

struct AppScreenBackgroundModifier: ViewModifier {
    
    var style: Style = .solid

    enum Style {
        case solid
        case subtleGradient
        case welcome
    }

    func body(content: Content) -> some View {
        ZStack {
            backgroundView
                .ignoresSafeArea()

            content
        }
    }

    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .solid:
            Color.theme.background

        case .subtleGradient:
            ZStack {
                Color.theme.background

                LinearGradient(
                    colors: [
                        Color.theme.primary.opacity(0.08),
                        Color.theme.background,
                        Color.theme.background
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                Circle()
                    .fill(Color.theme.primary.opacity(0.06))
                    .frame(width: 280, height: 280)
                    .blur(radius: 60)
                    .offset(x: 160, y: -200)
            }
            
        case .welcome:
            ZStack {
                Color.theme.background

                LinearGradient(
                    colors: [
                        Color.theme.primaryDark.opacity(0.20),
                        Color.theme.primary.opacity(0.10),
                        Color.theme.background
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                // Soft glow blobs (tweak opacity to be more/less solid)
                Circle()
                    .fill(Color.theme.primary.opacity(0.18))
                    .frame(width: 280, height: 280)
                    .blur(radius: 50)
                    .offset(x: 150, y: -170)

                Circle()
                    .fill(Color.theme.primaryLight.opacity(0.14))
                    .frame(width: 340, height: 340)
                    .blur(radius: 56)
                    .offset(x: -170, y: 260)
            }
        }
    }
}

extension View {
    func appScreenBackground(_ style: AppScreenBackgroundModifier.Style = .solid) -> some View {
        self.modifier(AppScreenBackgroundModifier(style: style))
    }
}
