//
//  SettingsView.swift
//  Avello
//
//  Created by Aditya Chauhan on 03/03/26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 16) {
            Text("Settings")
                .font(.title.bold())
            Text("Notifications, privacy, and preferences.")
                .foregroundStyle(.secondary)

            Button("Back") {
                router.pop()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
        .environmentObject(Router())
}
