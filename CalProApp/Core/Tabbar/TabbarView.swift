//
//  TabbarView.swift
//  CalProApp
//
//  Created by Adi Amoyal on 01/01/2026.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            TodayView(state: TodayDashboardMock.sample())
                .tabItem {
                    Label("Today", systemImage: "house.fill")
                }
            
            LogView()
                .tabItem {
                    Label("Log", systemImage: "plus.circle.fill")
                }
            
            ProgressTabView()
                .tabItem {
                    Label("Progress", systemImage: "chart.line.uptrend.xyaxis")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    TabbarView()
}
