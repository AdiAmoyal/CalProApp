//
//  AppMark.swift
//  CalProApp
//
//  Created by Adi Amoyal on 04/01/2026.
//

import SwiftUI

struct AppMark: View {
    @State private var float = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .strokeBorder(Color.white.opacity(0.16), lineWidth: 1)
                )
                .frame(width: 96, height: 96)
                .shadow(color: .black.opacity(0.18), radius: 22, x: 0, y: 12)

            Image(systemName: "bolt.heart.fill")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.theme.primary, Color.theme.primaryLight],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        }
        .offset(y: float ? -6 : 6)
        .animation(.easeInOut(duration: 2.2).repeatForever(autoreverses: true), value: float)
        .onAppear { float = true }
    }
}
