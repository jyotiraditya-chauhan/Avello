//
//  AvelloApp.swift
//  Avello
//
//  Created by Aditya Chauhan on 17/02/26.
//

import SwiftUI

@main
struct AvelloApp: App {
    @StateObject private var router = Router()
    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            ThemeHost(manager: themeManager) {
                ContentView()
                    .environmentObject(router)
            }
        }
    }
}
