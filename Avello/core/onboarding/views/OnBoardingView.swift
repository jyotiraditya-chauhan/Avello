//
//  OnBoardingView.swift
//  Avello
//
//  Created by Aditya Chauhan on 02/03/26.
//

import SwiftUI

struct OnboardingItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let accent: Color
}

let onboardingData: [OnboardingItem] = [
    OnboardingItem(
        title: "Know Your Bandwidth",
        description: "ADHD is an emotional regulation challenge. Avelo adapts to your capacity each day — not the other way around.",
        icon: "waveform.path.ecg",
        accent: Color(hex: "#7B6EF6")
    ),
    OnboardingItem(
        title: "Plan Without Pressure",
        description: "Tell us your day like you'd text a friend. Our AI turns it into a calm, prioritised plan based on how you feel.",
        icon: "brain.head.profile",
        accent: Color(hex: "#5AC8FA")
    ),
    OnboardingItem(
        title: "Grounded When It Counts",
        description: "When overwhelm hits, Avelo steps in with breathing, grounding, and ice therapy — available in seconds.",
        icon: "leaf.fill",
        accent: Color(hex: "#34C759")
    )
]



struct OnBoardingView: View {
    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0
    @EnvironmentObject var router: Router
    @EnvironmentObject private var manager: ThemeManager
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ForEach(0..<onboardingData.count, id: \.self) { index in
                    InteractiveWheelItem(
                        item: onboardingData[index],
                        index: index,
                        currentIndex: currentIndex,
                        dragOffset: dragOffset,
                        primaryColor: manager.theme.textPrimary,
                        secondryColor: manager.theme.textSecondary,
                    )
                }
            }
            .frame(maxHeight: .infinity)

            VStack(spacing: 32) {
                HStack(spacing: 8) {
                    ForEach(0..<onboardingData.count, id: \.self) { index in
                        Capsule()
                            .fill(index == currentIndex ? Color.white : Color.white.opacity(0.2))
                            .frame(width: index == currentIndex ? 32 : 8, height: 8)
                            .animation(.easeInOut(duration: 0.3), value: currentIndex)
                    }
                }

                Button {
                    if currentIndex < onboardingData.count - 1 {
                        HapticManager.shared.trigger(.light)
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            currentIndex += 1
                        }
                    } else {
                        HapticManager.shared.trigger(.heavy)
//                        hasCompletedOnboarding = true
                        router.navigateTo(.auth)
                    }
                } label: {
                    Text(currentIndex == onboardingData.count - 1 ? "Continue" : "Next")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.white)
                        .cornerRadius(30)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .safeAreaPadding(.top)
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged { value in
                    let isFirst = currentIndex == 0 && value.translation.width > 0
                    let isLast  = currentIndex == onboardingData.count - 1 && value.translation.width < 0
                    if !isFirst && !isLast {
                        dragOffset = value.translation.width
                    }
                }
                .onEnded { value in
                    let threshold: CGFloat = 50
                    if value.translation.width < -threshold, currentIndex < onboardingData.count - 1 {
                        HapticManager.shared.trigger(.medium)
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) { currentIndex += 1 }
                    } else if value.translation.width > threshold, currentIndex > 0 {
                        HapticManager.shared.trigger(.medium)
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) { currentIndex -= 1 }
                    }
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) { dragOffset = 0 }
                }
        )
    }
}


struct InteractiveWheelItem: View {
    let item: OnboardingItem
    let index: Int
    let currentIndex: Int
    let dragOffset: CGFloat
    let primaryColor: Color
    let secondryColor: Color

    var body: some View {
        let screenWidth  = UIScreen.main.bounds.width
        let dragProgress = dragOffset / screenWidth
        let interpolated = CGFloat(currentIndex) - dragProgress
        let relative     = CGFloat(index) - interpolated
        let distance     = abs(relative)

        VStack(spacing: 40) {
            Image(systemName: item.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .foregroundStyle(item.accent)
                .shadow(color: item.accent.opacity(0.5), radius: 30, x: 0, y: 10)

            VStack(spacing: 16) {
                Text(item.title)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(primaryColor)
                    .multilineTextAlignment(.center)

                Text(item.description)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(secondryColor)
                    .multilineTextAlignment(.center)
                    .lineSpacing(5)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 32)
            }
        }
        .padding(.top, 40)
        .frame(width: screenWidth)
        .scaleEffect(max(0.75, 1.0 - distance * 0.25))
        .opacity(Double(max(0, 1.0 - distance * 1.2)))
        .rotationEffect(.degrees(Double(relative) * 15), anchor: UnitPoint(x: 0.5, y: 2.5))
        .offset(x: relative * 180)
        .blur(radius: distance * 1.5)
        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: currentIndex)
        .animation(.interactiveSpring(), value: dragOffset)
    }
}
