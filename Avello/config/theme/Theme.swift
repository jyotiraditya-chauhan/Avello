//
//  Theme.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import SwiftUI


extension Theme {

    static let dark = Theme(
        id: "dark", name: "Dark",
        background:          Color(hex: "#0D0D10"),
        backgroundSecondary: Color(hex: "#141418"),
        card:                Color(hex: "#1C1C28"),
        cardBorder:          Color(white: 1, opacity: 0.07),
        overlay:             Color.black.opacity(0.6),
        textPrimary:         Color(.white),
        textSecondary:       Color(white: 1, opacity: 0.55),
        textTertiary:        Color(white: 1, opacity: 0.28),
        textOnAccent:        .white,
        accent:              Color(hex: "#7B6EF6"),
        accentMuted:         Color(hex: "#7B6EF6").opacity(0.18),
        accentSecondary:     Color(.systemTeal),
        success:             Color(.systemGreen),
        warning:             Color(.systemOrange),
        danger:              Color(.systemRed),
        info:                Color(.systemBlue),
        buttonPrimary:       Color(hex: "#7B6EF6"),
        buttonSecondary:     Color(hex: "#2A2A3C"),
        buttonDestructive:   Color(.systemRed),
        inputBackground:     Color(hex: "#1E1E2C"),
        inputBorder:         Color(white: 1, opacity: 0.08),
        inputBorderFocused:  Color(hex: "#7B6EF6"),
        tabBarBackground:    Color(hex: "#111118"),
        tabBarActive:        Color(hex: "#7B6EF6"),
        tabBarInactive:      Color(white: 1, opacity: 0.28),
        navBarBackground:    Color(hex: "#0D0D10"),
        divider:             Color(white: 1, opacity: 0.07),
        cornerRadius:        18,
        cornerRadiusSmall:   10,
        cornerRadiusLarge:   28,
        shadowColor:         Color(hex: "#7B6EF6").opacity(0.20),
        shadowRadius:        16,
        shadowY:             6,
        capacityHigh:        Color(.systemGreen),
        capacityMedium:      Color(.systemOrange),
        capacityLow:         Color(.systemRed),
        defaultBackground:   .aurora
    )

    static let light = Theme(
        id: "light", name: "Light",
        background:          Color(.systemGroupedBackground),
        backgroundSecondary: Color(.secondarySystemGroupedBackground),
        card:                Color(.systemBackground),
        cardBorder:          Color(.separator),
        overlay:             Color.black.opacity(0.35),
        textPrimary:         Color(.label),
        textSecondary:       Color(.secondaryLabel),
        textTertiary:        Color(.tertiaryLabel),
        textOnAccent:        .white,
        accent:              Color(.systemIndigo),
        accentMuted:         Color(.systemIndigo).opacity(0.12),
        accentSecondary:     Color(.systemTeal),
        success:             Color(.systemGreen),
        warning:             Color(.systemOrange),
        danger:              Color(.systemRed),
        info:                Color(.systemBlue),
        buttonPrimary:       Color(.systemIndigo),
        buttonSecondary:     Color(.secondarySystemFill),
        buttonDestructive:   Color(.systemRed),
        inputBackground:     Color(.secondarySystemBackground),
        inputBorder:         Color(.separator),
        inputBorderFocused:  Color(.systemIndigo),
        tabBarBackground:    Color(.systemBackground),
        tabBarActive:        Color(.systemIndigo),
        tabBarInactive:      Color(.tertiaryLabel),
        navBarBackground:    Color(.systemBackground),
        divider:             Color(.separator),
        cornerRadius:        18,
        cornerRadiusSmall:   10,
        cornerRadiusLarge:   28,
        shadowColor:         Color(.systemIndigo).opacity(0.10),
        shadowRadius:        14,
        shadowY:             5,
        capacityHigh:        Color(.systemGreen),
        capacityMedium:      Color(.systemOrange),
        capacityLow:         Color(.systemRed),
        defaultBackground:   .mist
    )

    static let ocean = Theme(
        id: "ocean", name: "Ocean",
        background:          Color(hex: "#040D18"),
        backgroundSecondary: Color(hex: "#071525"),
        card:                Color(hex: "#0A1929"),
        cardBorder:          Color(white: 1, opacity: 0.06),
        overlay:             Color.black.opacity(0.65),
        textPrimary:         Color(.systemCyan).opacity(0.95),
        textSecondary:       Color(.systemTeal).opacity(0.70),
        textTertiary:        Color(.systemTeal).opacity(0.35),
        textOnAccent:        .white,
        accent:              Color(.systemTeal),
        accentMuted:         Color(.systemTeal).opacity(0.15),
        accentSecondary:     Color(.systemCyan),
        success:             Color(.systemGreen),
        warning:             Color(.systemOrange),
        danger:              Color(.systemRed),
        info:                Color(.systemTeal),
        buttonPrimary:       Color(.systemTeal),
        buttonSecondary:     Color(hex: "#0D2235"),
        buttonDestructive:   Color(.systemRed),
        inputBackground:     Color(hex: "#071525"),
        inputBorder:         Color(white: 1, opacity: 0.07),
        inputBorderFocused:  Color(.systemTeal),
        tabBarBackground:    Color(hex: "#030C16"),
        tabBarActive:        Color(.systemTeal),
        tabBarInactive:      Color(.systemTeal).opacity(0.35),
        navBarBackground:    Color(hex: "#040D18"),
        divider:             Color(white: 1, opacity: 0.06),
        cornerRadius:        18,
        cornerRadiusSmall:   10,
        cornerRadiusLarge:   28,
        shadowColor:         Color(.systemTeal).opacity(0.22),
        shadowRadius:        18,
        shadowY:             6,
        capacityHigh:        Color(.systemGreen),
        capacityMedium:      Color(.systemOrange),
        capacityLow:         Color(.systemRed),
        defaultBackground:   .midnight
    )

    static let forest = Theme(
        id: "forest", name: "Forest",
        background:          Color(hex: "#050E07"),
        backgroundSecondary: Color(hex: "#091510"),
        card:                Color(hex: "#0C1E10"),
        cardBorder:          Color(white: 1, opacity: 0.06),
        overlay:             Color.black.opacity(0.65),
        textPrimary:         Color(.systemGreen).opacity(0.95),
        textSecondary:       Color(.systemGreen).opacity(0.65),
        textTertiary:        Color(.systemGreen).opacity(0.30),
        textOnAccent:        .white,
        accent:              Color(.systemGreen),
        accentMuted:         Color(.systemGreen).opacity(0.15),
        accentSecondary:     Color(.systemMint),
        success:             Color(.systemGreen),
        warning:             Color(.systemOrange),
        danger:              Color(.systemRed),
        info:                Color(.systemMint),
        buttonPrimary:       Color(.systemGreen),
        buttonSecondary:     Color(hex: "#0E2012"),
        buttonDestructive:   Color(.systemRed),
        inputBackground:     Color(hex: "#091510"),
        inputBorder:         Color(white: 1, opacity: 0.07),
        inputBorderFocused:  Color(.systemGreen),
        tabBarBackground:    Color(hex: "#040C06"),
        tabBarActive:        Color(.systemGreen),
        tabBarInactive:      Color(.systemGreen).opacity(0.30),
        navBarBackground:    Color(hex: "#050E07"),
        divider:             Color(white: 1, opacity: 0.06),
        cornerRadius:        18,
        cornerRadiusSmall:   10,
        cornerRadiusLarge:   28,
        shadowColor:         Color(.systemGreen).opacity(0.20),
        shadowRadius:        16,
        shadowY:             6,
        capacityHigh:        Color(.systemGreen),
        capacityMedium:      Color(.systemOrange),
        capacityLow:         Color(.systemRed),
        defaultBackground:   .midnight
    )

    static let sunset = Theme(
        id: "sunset", name: "Sunset",
        background:          Color(hex: "#100A04"),
        backgroundSecondary: Color(hex: "#1A1008"),
        card:                Color(hex: "#1E1108"),
        cardBorder:          Color(white: 1, opacity: 0.06),
        overlay:             Color.black.opacity(0.65),
        textPrimary:         Color(.systemOrange).opacity(0.95),
        textSecondary:       Color(.systemOrange).opacity(0.65),
        textTertiary:        Color(.systemOrange).opacity(0.30),
        textOnAccent:        .white,
        accent:              Color(.systemOrange),
        accentMuted:         Color(.systemOrange).opacity(0.15),
        accentSecondary:     Color(.systemYellow),
        success:             Color(.systemGreen),
        warning:             Color(.systemOrange),
        danger:              Color(.systemRed),
        info:                Color(.systemYellow),
        buttonPrimary:       Color(.systemOrange),
        buttonSecondary:     Color(hex: "#251508"),
        buttonDestructive:   Color(.systemRed),
        inputBackground:     Color(hex: "#1A1008"),
        inputBorder:         Color(white: 1, opacity: 0.07),
        inputBorderFocused:  Color(.systemOrange),
        tabBarBackground:    Color(hex: "#0D0804"),
        tabBarActive:        Color(.systemOrange),
        tabBarInactive:      Color(.systemOrange).opacity(0.30),
        navBarBackground:    Color(hex: "#100A04"),
        divider:             Color(white: 1, opacity: 0.06),
        cornerRadius:        18,
        cornerRadiusSmall:   10,
        cornerRadiusLarge:   28,
        shadowColor:         Color(.systemOrange).opacity(0.20),
        shadowRadius:        16,
        shadowY:             6,
        capacityHigh:        Color(.systemGreen),
        capacityMedium:      Color(.systemOrange),
        capacityLow:         Color(.systemRed),
        defaultBackground:   .dawn
    )

    static let all: [Theme] = [.dark, .light, .ocean, .forest, .sunset]
}




extension AppBackground {

    static let aurora   = AppBackground(id: "aurora",   name: "Aurora",   thumbnail: Color(hex: "#2D1B69")) { AuroraBackground() }
    static let cosmic   = AppBackground(id: "cosmic",   name: "Cosmic",   thumbnail: Color(hex: "#1A000D")) { CosmicBackground() }
    static let midnight = AppBackground(id: "midnight", name: "Midnight", thumbnail: Color(hex: "#04080F")) { MidnightBackground() }
    static let mist     = AppBackground(id: "mist",     name: "Mist",     thumbnail: Color(hex: "#F0F2F5")) { MistBackground() }
    static let dawn     = AppBackground(id: "dawn",     name: "Dawn",     thumbnail: Color(hex: "#FFF0E6")) { DawnBackground() }
    static let bokeh     = AppBackground(id: "bokeh",     name: "Bokeh",     thumbnail: Color(hex: "#FFF0E6")) { BokehBackgroundView() }
    static let all: [AppBackground] = [.aurora, .cosmic, .midnight, .mist, .dawn]
}

