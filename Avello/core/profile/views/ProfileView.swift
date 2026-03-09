//
//  ProfileView.swift
//  Avello
//
//  Created by Aditya Chauhan on 03/03/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 16) {
            Text("Profile")
                .font(.title.bold())
            Text("Account, preferences, and progress.")
                .foregroundStyle(.secondary)

            Button("Settings") {
                router.push(.settings)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
        .environmentObject(Router())
}
