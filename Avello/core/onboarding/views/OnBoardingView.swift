//
//  OnBoardingView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import SwiftUI

struct OnBoardingView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome to Avello")
                .font(.title.bold())
            Text("A calmer, smarter way to plan your day.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            Button("Continue") {
                router.navigateTo(.auth)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    OnBoardingView()
        .environmentObject(Router())
}
