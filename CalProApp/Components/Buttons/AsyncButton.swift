//
//  AsyncButton.swift
//  CalProApp
//
//  Created by Adi Amoyal on 10/01/2026.
//

import SwiftUI

struct AsyncButton: View {
    
    var isLoading: Bool = false
    var title: String = "Save"
    let systemImage: String?
    var action: () -> Void
    
    init(isLoading: Bool, title: String, systemImage: String? = nil, action: @escaping () -> Void) {
        self.isLoading = isLoading
        self.title = title
        self.systemImage = systemImage
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    HStack(spacing: 10) {
                        if let systemImage {
                            Image(systemName: systemImage)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        
                        Text(title)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                    }
                }
            }
            .callToActionButton()
        }
        .disabled(isLoading)
    }
}

#Preview {
    AsyncButton(isLoading: false, title: "Save") {
        
    }
}
