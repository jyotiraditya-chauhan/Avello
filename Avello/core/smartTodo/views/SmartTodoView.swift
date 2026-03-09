//
//  SmartTodoView.swift
//  Avello
//
//  Created by Aditya Chauhan on 03/03/26.
//

import SwiftUI

struct SmartTodoView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Smart To-Do")
                .font(.title.bold())
            Text("Drop your tasks. We organize the day for you.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    SmartTodoView()
}
