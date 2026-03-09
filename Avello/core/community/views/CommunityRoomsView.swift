//
//  CommunityRoomsView.swift
//  Avello
//
//  Created by Aditya Chauhan on 03/03/26.
//

import SwiftUI

struct CommunityRoomsView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Community Rooms")
                .font(.title.bold())
            Text("Join a focus room with others.")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    CommunityRoomsView()
}
