//
//  PrimaryButton.swift
//  CalProApp
//
//  Created by Adi Amoyal on 04/01/2026.
//

import SwiftUI

struct PrimaryNavigationButton<Destination: View>: View {
    let title: String
    let systemImage: String?
    let destination: Destination
    
    init(title: String, systemImage: String? = nil, destination: Destination) {
        self.title = title
        self.systemImage = systemImage
        self.destination = destination
    }

    var body: some View {
        NavigationLink {
            destination
        } label: {
            HStack(spacing: 10) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                
                if let systemImage {
                    Image(systemName: systemImage)
                        .font(.system(size: 15, weight: .semibold))
                }
            }
            .callToActionButton()
        }
    }
}
