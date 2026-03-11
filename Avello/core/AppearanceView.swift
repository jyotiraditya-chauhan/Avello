//
//  HomeView.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var manager: ThemeManager
    @Namespace private var ns

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                livePreview

                pickerSection(title: "Theme") {
                    ForEach(Theme.all) { t in
                        ThemeChip(
                            label: t.name,
                            accent: t.accent,
                            surface: t.card,
                            isSelected: manager.theme.id == t.id,
                            ringId: "theme-ring",
                            namespace: ns
                        ) {
                            manager.setTheme(t)
                        }
                    }
                }

                pickerSection(title: "Background") {
                    ForEach(AppBackground.all) { bg in
                        ThemeChip(
                            label: bg.name,
                            accent: manager.theme.accent,
                            surface: bg.thumbnail,
                            isSelected: manager.background.id == bg.id,
                            ringId: "bg-ring",
                            namespace: ns
                        ) {
                            manager.setBackground(bg)
                        }
                    }
                }

                if manager.hasCustomBackground {
                    Button {
                        manager.resetBackgroundToDefault()
                    } label: {
                        Label("Reset to theme default", systemImage: "arrow.counterclockwise")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(manager.theme.accent)
                    }
                    .padding(.horizontal, 20)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }

                Spacer(minLength: 40)
            }
            .padding(.vertical, 24)
            .animation(.spring(response: 0.35), value: manager.hasCustomBackground)
        }
        .scrollContentBackground(.hidden)
        .transparentContainer()
        .navigationTitle("Appearance")
        .navigationBarTitleDisplayMode(.large)
    }

    private var livePreview: some View {
        ZStack {
            manager.background.make()
                .id(manager.background.id)
                .transition(.opacity)
                .allowsHitTesting(false)

            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Emotional Capacity")
                        .font(.system(size: 13, weight: .semibold))
                }
                .foregroundStyle(manager.theme.textSecondary)

                Text("Bandwidth is high today 🌿")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(manager.theme.textPrimary)

                Spacer()

                RoundedRectangle(cornerRadius: 4)
                    .fill(manager.theme.accent)
                    .frame(width: 48, height: 5)
            }
            .padding(18)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: manager.theme.cornerRadius, style: .continuous)
                    .fill(manager.theme.card.opacity(0.88))
                    .overlay(
                        RoundedRectangle(cornerRadius: manager.theme.cornerRadius, style: .continuous)
                            .strokeBorder(manager.theme.cardBorder, lineWidth: 1)
                    )
            )
            .padding(20)
        }
        .frame(height: 190)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .padding(.horizontal, 20)
        .animation(.easeInOut(duration: 0.4), value: manager.background.id)
        .animation(.easeInOut(duration: 0.3), value: manager.theme.id)
    }

    @ViewBuilder
    private func pickerSection(title: String, @ViewBuilder chips: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .tracking(0.8)
                .textCase(.uppercase)
                .foregroundStyle(manager.theme.textSecondary)
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) { chips() }
                    .padding(.horizontal, 20)
            }
        }
    }
}

private struct ThemeChip: View {
    let label: String
    let accent: Color
    let surface: Color
    let isSelected: Bool
    let ringId: String
    let namespace: Namespace.ID
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(surface)
                    .frame(width: 70, height: 50)
                    .overlay(alignment: .bottomLeading) {
                        Circle()
                            .fill(accent)
                            .frame(width: 12, height: 12)
                            .padding(7)
                    }
                    .overlay {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .strokeBorder(accent, lineWidth: 2.5)
                                .matchedGeometryEffect(id: ringId, in: namespace)
                        }
                    }

                Text(label)
                    .font(.system(size: 12, weight: isSelected ? .semibold : .regular))
                    .foregroundStyle(isSelected ? accent : .secondary)
            }
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}

struct AppearanceSheet: View {
    @EnvironmentObject private var manager: ThemeManager
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            HomeView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") { dismiss() }
                            .foregroundStyle(manager.theme.accent)
                    }
                }
        }
        .transparentNavigation()
        .environmentObject(manager)
    }
}

#Preview("Dark") {
    NavigationStack {
        HomeView()
    }
    .environmentObject(ThemeManager())
}

#Preview("Light") {
    let m = ThemeManager()
    NavigationStack {
        HomeView()
    }
    .environmentObject(m)
}
