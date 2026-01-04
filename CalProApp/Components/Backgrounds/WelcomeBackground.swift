//
//  WelcomeBackground.swift
//  CalProApp
//
//  Created by Adi Amoyal on 04/01/2026.
//

import SwiftUI

struct WelcomeBackground: View {
    var body: some View {
        ZStack {
            Color.theme.background

            LinearGradient(
                colors: [
                    Color.theme.primaryDark.opacity(0.35),
                    Color.theme.primary.opacity(0.18),
                    Color.theme.background
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            // Soft glow blobs
            Circle()
                .fill(Color.theme.primary.opacity(0.25))
                .frame(width: 280, height: 280)
                .blur(radius: 40)
                .offset(x: 150, y: -170)

            Circle()
                .fill(Color.theme.primaryLight.opacity(0.20))
                .frame(width: 340, height: 340)
                .blur(radius: 46)
                .offset(x: -170, y: 260)
        }
    }
}
