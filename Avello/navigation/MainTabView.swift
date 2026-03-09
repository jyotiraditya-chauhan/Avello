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
            }

            Tab(MainTab.community.rawValue, systemImage: "person.2") {
                CommunityRoomsView()
            }
        }
        .tabViewBottomAccessory {
            BottomAccessoryBar(showSmartTodo: $showSmartTodo)
        }
        .sheet(isPresented: $showSmartTodo) {
            SmartTodoView()
        }
    }
}

#if swift(>=6.0)
private struct BottomAccessoryBar: View {
    @Environment(\.tabViewBottomAccessoryPlacement) private var placement
    @Binding var showSmartTodo: Bool

    var body: some View {
        HStack {
            Spacer()
            Button {
                showSmartTodo = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: placement == .inline ? 16 : 18, weight: .bold))
                    .frame(width: placement == .inline ? 36 : 44,
                           height: placement == .inline ? 36 : 44)
            }
            .buttonStyle(.borderedProminent)
            .clipShape(Circle())
            .accessibilityLabel("Add Task")
        }
        .padding(.horizontal, 16)
        .padding(.bottom, placement == .inline ? 2 : 8)
    }
}
#else
private struct BottomAccessoryBar: View {
    @Binding var showSmartTodo: Bool

    var body: some View {
        HStack {
            Spacer()
            Button {
                showSmartTodo = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.borderedProminent)
            .clipShape(Circle())
            .accessibilityLabel("Add Task")
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}
#endif

#Preview {
    NavigationStack {
        MainTabView()
            .environmentObject(Router())
    }
}
