//
//  MainTabView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import SwiftUI

private enum MainTab: String, CaseIterable, Hashable {
    case home = "Home"
    case community = "Community"
}

struct MainTabView: View {
    @State private var showSmartTodo = false

    var body: some View {
        TabView {
            Tab(MainTab.home.rawValue, systemImage: "house") {
                HomeView()
                    .transparentContainer()
            }
            Tab(MainTab.community.rawValue, systemImage: "person.2") {
                CommunityRoomsView()
                    .transparentContainer()
            }
        }
        .transparentTabBar()
        .sheet(isPresented: $showSmartTodo) {
            SmartTodoView()
        }
    }
}

#Preview {
    NavigationStack {
        MainTabView()
            .environmentObject(Router())
    }
}
