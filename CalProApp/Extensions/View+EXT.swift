//
//  View+EXT.swift
//  CalProApp
//
//  Created by Adi Amoyal on 03/01/2026.
//

import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        self
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.theme.primary)
            )
            .shadow(color: Color.theme.primary.opacity(0.35), radius: 18, x: 0, y: 10)
    }
}
