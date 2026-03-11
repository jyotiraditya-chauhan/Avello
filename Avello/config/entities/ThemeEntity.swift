//
//  ThemeEntity.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import Foundation
import SwiftUI


struct Theme: Identifiable, Equatable {
    let id: String
    let name: String
    let background: Color
    let backgroundSecondary: Color
    let card: Color
    let cardBorder: Color
    let overlay: Color
    let textPrimary: Color
    let textSecondary: Color
    let textTertiary: Color
    let textOnAccent: Color
    let accent: Color
    let accentMuted: Color
    let accentSecondary: Color
    let success: Color
    let warning: Color
    let danger: Color
    let info: Color
    let buttonPrimary: Color
    let buttonSecondary: Color
    let buttonDestructive: Color
    let inputBackground: Color
    let inputBorder: Color
    let inputBorderFocused: Color
    let tabBarBackground: Color
    let tabBarActive: Color
    let tabBarInactive: Color
    let navBarBackground: Color
    let divider: Color
    let cornerRadius: CGFloat
    let cornerRadiusSmall: CGFloat
    let cornerRadiusLarge: CGFloat
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowY: CGFloat
    let capacityHigh: Color
    let capacityMedium: Color
    let capacityLow: Color
    let defaultBackground: AppBackground
}


struct AppBackground: Identifiable, Equatable {
    let id: String
    let name: String
    let thumbnail: Color
    private let factory: () -> AnyView

    init(id: String, name: String, thumbnail: Color, @ViewBuilder _ view: @escaping () -> some View) {
        self.id = id
        self.name = name
        self.thumbnail = thumbnail
        self.factory = { AnyView(view()) }
    }

    func make() -> AnyView { factory() }
    static func == (lhs: AppBackground, rhs: AppBackground) -> Bool { lhs.id == rhs.id }
}
