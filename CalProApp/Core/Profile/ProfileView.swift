//
//  ProfileView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 01/01/2026.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(AppState.self) private var appState
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Profile")
                
                Button {
                    onSignoutPressed()
                } label: {
                    Text("Sign out")
                }
            }
        }
    }
    
    func onSignoutPressed() {
        // TODO: Add some logic to sign user out of app
        dismiss()
        
        Task {
            try? await Task.sleep(for: .seconds(0.5))
            appState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
}
