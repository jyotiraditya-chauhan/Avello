//
//  LoginView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 16) {
            Text("Sign In")
                .font(.title.bold())

            Button("Continue with Google") {}
                .buttonStyle(.bordered)
            Button("Continue with Apple") {}
                .buttonStyle(.bordered)
            Button("Sign in with Email") {}
                .buttonStyle(.bordered)

            Divider()

            Button("Take assessment") {
                router.navigateTo(.assessment)
            }
            .buttonStyle(.borderedProminent)

            Button("Skip for now") {
                router.navigateTo(.main)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(Router())
}
