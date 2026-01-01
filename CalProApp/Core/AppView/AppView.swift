//
//  AppView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 01/01/2026.
//

import SwiftUI

struct AppView: View {
    
    @AppStorage("showTabbarView") var showTabbar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabbar,
            tabbarView: {
                Text("Tabbar")
            },
            onboardingView: {
                Text("Onboarding")
            }
        )
    }
}

#Preview("AppView - TabBar") {
    AppView(showTabbar: true)
}

#Preview("AppView - Onboarding") {
    AppView(showTabbar: false)
}
