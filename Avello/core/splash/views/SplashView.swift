//
//  SplashView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 16) {
            Text("Avello")
                .font(.largeTitle.bold())
            Text("Focus-first productivity")
                .foregroundStyle(.secondary)

            Button("Get Started") {
                router.navigateTo(.onboarding)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    SplashView()
        .environmentObject(Router())
}
