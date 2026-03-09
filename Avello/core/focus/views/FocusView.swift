//
//  FocusView.swift
//  Avello
//
//  Created by Aditya Chauhan on 03/03/26.
//

import SwiftUI

struct FocusView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 16) {
            Text("Focus Sessions")
                .font(.title.bold())
            Text("Start a timed session or join a room.")
                .foregroundStyle(.secondary)

            Button("Start Focus Session") {}
                .buttonStyle(.borderedProminent)

            Button("Join Community Room") {
                router.push(.communityRooms)
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    FocusView()
        .environmentObject(Router())
}
