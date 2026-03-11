//
//  ContentView.swift
//  Braille
//
//  Created by GU on 21/01/26.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var router: Router
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    @State private var startContentAnimation = false

    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                Image(AppImages.appIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120).cornerRadius(999)

                Text("Avello")
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .tracking(2)
            }
            .scaleEffect(startContentAnimation ? 1 : 0.9)
            .opacity(startContentAnimation ? 1 : 0)
            .offset(y: startContentAnimation ? 0 : 20)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) {
                startContentAnimation = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if hasCompletedOnboarding {
                    router.navigateTo(.main)
                } else {
                    router.navigateTo(.onboarding)
                }
            }
        }
    }
}


