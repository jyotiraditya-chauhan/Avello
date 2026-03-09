//
//  GroundingView.swift
//  Avello
//
//  Created by Aditya Chauhan on 03/03/26.
//

import SwiftUI

struct GroundingView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Grounding")
                .font(.title.bold())
            Text("Quick resets for stress and overwhelm.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    GroundingView()
}
