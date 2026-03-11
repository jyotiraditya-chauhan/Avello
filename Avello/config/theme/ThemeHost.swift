//
//  ThemeHost.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import SwiftUI

struct ThemeHost<Content: View>: View {
    @ObservedObject var manager: ThemeManager
    @Environment(\.isBackgroundVisible) private var backgroundVisible
    @ViewBuilder let content: Content

    var body: some View {
        ZStack {
            if backgroundVisible {
                manager.background.make()
                    .id(manager.background.id)
                    .transition(.opacity)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }
            content
        }
        .transparentContainer()
        .animation(.easeInOut(duration: 0.45), value: manager.background.id)
        .animation(.easeInOut(duration: 0.3), value: manager.theme.id)
        .animation(.easeInOut(duration: 0.25), value: backgroundVisible)
        .environmentObject(manager)
    }
}
