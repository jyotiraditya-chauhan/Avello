//
//  ThemeManager.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import SwiftUI
import Combine

@MainActor
final class ThemeManager: ObservableObject {

    @Published private(set) var theme: Theme
    @Published private(set) var background: AppBackground
    @Published private(set) var hasCustomBackground: Bool

    private let themeKey    = "avelo.themeId"
    private let bgKey       = "avelo.bgId"
    private let customBgKey = "avelo.customBg"

    init() {
        let savedThemeId = UserDefaults.standard.string(forKey: "avelo.themeId")
        let savedBgId    = UserDefaults.standard.string(forKey: "avelo.bgId")
        let hasCustom    = UserDefaults.standard.bool(forKey: "avelo.customBg")

        let resolvedTheme = Theme.all.first { $0.id == savedThemeId } ?? .dark
        let resolvedBg: AppBackground

        if hasCustom, let bgId = savedBgId {
            resolvedBg = AppBackground.all.first { $0.id == bgId } ?? resolvedTheme.defaultBackground
        } else {
            resolvedBg = resolvedTheme.defaultBackground
        }

        self.theme               = resolvedTheme
        self.background          = resolvedBg
        self.hasCustomBackground = hasCustom
    }

    func setTheme(_ t: Theme) {
        withAnimation(.easeInOut(duration: 0.3)) {
            theme = t
            if !hasCustomBackground { background = t.defaultBackground }
        }
        UserDefaults.standard.set(t.id, forKey: themeKey)
    }

    func setBackground(_ bg: AppBackground) {
        withAnimation(.easeInOut(duration: 0.4)) { background = bg }
        hasCustomBackground = true
        UserDefaults.standard.set(bg.id, forKey: bgKey)
        UserDefaults.standard.set(true,  forKey: customBgKey)
    }

    func resetBackgroundToDefault() {
        withAnimation(.easeInOut(duration: 0.4)) { background = theme.defaultBackground }
        hasCustomBackground = false
        UserDefaults.standard.removeObject(forKey: bgKey)
        UserDefaults.standard.set(false, forKey: customBgKey)
    }
}
