//
//  AuthView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject private var router: Router
    @EnvironmentObject private var manager: ThemeManager
    
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
    AuthView()
        .environmentObject(Router())
}
