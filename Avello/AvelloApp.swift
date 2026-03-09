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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
