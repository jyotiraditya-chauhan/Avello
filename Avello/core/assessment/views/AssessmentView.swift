//
//  AssessmentView.swift
//  Avello
//
//  Created by Aditya Chauhan on 03/03/26.
//

import SwiftUI

struct AssessmentView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        VStack(spacing: 16) {
            Text("Assessment")
                .font(.title.bold())
            Text("18 short questions to personalize your focus plan.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)

            Button("Start Assessment") {}
                .buttonStyle(.bordered)

            Button("Finish for now") {
                router.navigateTo(.main)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    AssessmentView()
        .environmentObject(Router())
}
