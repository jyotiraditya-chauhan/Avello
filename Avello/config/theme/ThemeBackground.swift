//
//  ThemeBackground.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import SwiftUI

private func drawOrb(canvas: inout GraphicsContext, center: CGPoint, radius: CGFloat, color: Color, innerOpacity: Double = 0.65, outerOpacity: Double = 0.18) {
    canvas.blendMode = .screen
    canvas.fill(
        Path(ellipseIn: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)),
        with: .radialGradient(
            Gradient(colors: [color.opacity(innerOpacity), color.opacity(outerOpacity), .clear]),
            center: center, startRadius: 0, endRadius: radius
        )
    )
}

struct AuroraBackground: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        if reduceMotion {
            Color(hex: "#0B0B16").ignoresSafeArea()
        } else {
            TimelineView(.animation) { ctx in
                Canvas { canvas, size in
                    let t = ctx.date.timeIntervalSinceReferenceDate

                    
                    canvas.fill(Path(CGRect(origin: .zero, size: size)),
                                with: .color(Color(hex: "#09090F")))


                    let orbs: [(CGPoint, Color, CGFloat)] = [
                        (.init(x: 0.05, y: 0.08),  Color(hex: "#2A1560"), 0.55),
                        (.init(x: 0.95, y: 0.10),  Color(hex: "#0F2050"), 0.50),
                        (.init(x: 0.08, y: 0.92),  Color(hex: "#1A0E55"), 0.50),
                        (.init(x: 0.92, y: 0.90),  Color(hex: "#0D2840"), 0.48),
                    ]

                    for (i, orb) in orbs.enumerated() {
                        let fi = Double(i)
                        let cx = (orb.0.x + sin(t * 0.07 + fi * 1.4) * 0.04) * size.width
                        let cy = (orb.0.y + cos(t * 0.06 + fi * 1.8) * 0.04) * size.height
                        let r  = min(size.width, size.height) * orb.2

                        canvas.blendMode = .screen
                        canvas.fill(
                            Path(ellipseIn: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2)),
                            with: .radialGradient(
                                Gradient(colors: [orb.1.opacity(0.55), orb.1.opacity(0.12), .clear]),
                                center: .init(x: cx, y: cy), startRadius: 0, endRadius: r
                            )
                        )
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct CosmicBackground: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        if reduceMotion {
            Color(hex: "#080008").ignoresSafeArea()
        } else {
            TimelineView(.animation) { ctx in
                Canvas { canvas, size in
                    let t = ctx.date.timeIntervalSinceReferenceDate

                
                    canvas.fill(Path(CGRect(origin: .zero, size: size)),
                                with: .color(Color(hex: "#070007")))


                    let orbs: [(CGPoint, Color, CGFloat)] = [
                        (.init(x: 0.04, y: 0.06),  Color(hex: "#3A0818"), 0.52),
                        (.init(x: 0.96, y: 0.08),  Color(hex: "#220030"), 0.50),
                        (.init(x: 0.50, y: 0.96),  Color(hex: "#300015"), 0.55),
                    ]

                    for (i, orb) in orbs.enumerated() {
                        let fi = Double(i)
                        let cx = (orb.0.x + sin(t * 0.06 + fi * 1.6) * 0.03) * size.width
                        let cy = (orb.0.y + cos(t * 0.05 + fi * 2.0) * 0.03) * size.height
                        let r  = min(size.width, size.height) * orb.2

                        canvas.blendMode = .screen
                        canvas.fill(
                            Path(ellipseIn: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2)),
                            with: .radialGradient(
                                Gradient(colors: [orb.1.opacity(0.60), orb.1.opacity(0.14), .clear]),
                                center: .init(x: cx, y: cy), startRadius: 0, endRadius: r
                            )
                        )
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct MidnightBackground: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private let orbs: [(CGPoint, Color, CGFloat)] = [
        (.init(x: 0.25, y: 0.30), Color(.systemBlue),   0.60),
        (.init(x: 0.75, y: 0.25), Color(.systemTeal),   0.50),
        (.init(x: 0.50, y: 0.70), Color(.systemBlue),   0.55),
        (.init(x: 0.80, y: 0.75), Color(.systemIndigo), 0.45),
    ]

    var body: some View {
        if reduceMotion {
            Color(hex: "#04080F").ignoresSafeArea()
        } else {
            TimelineView(.animation) { ctx in
                Canvas { canvas, size in
                    let t = ctx.date.timeIntervalSinceReferenceDate
                    canvas.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(hex: "#04080F")))
                    for (i, orb) in orbs.enumerated() {
                        let fi = Double(i)
                        let cx = (orb.0.x + sin(t * 0.06 + fi * 1.8) * 0.06) * size.width
                        let cy = (orb.0.y + cos(t * 0.05 + fi * 1.4) * 0.05) * size.height
                        let r  = min(size.width, size.height) * orb.2
                        drawOrb(canvas: &canvas, center: .init(x: cx, y: cy), radius: r, color: orb.1, innerOpacity: 0.18, outerOpacity: 0.05)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct MistBackground: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        if reduceMotion {
            Color.white.ignoresSafeArea()
        } else {
            TimelineView(.animation(minimumInterval: 1/24)) { ctx in
                Canvas { canvas, size in
                    let t = ctx.date.timeIntervalSinceReferenceDate

                
                    canvas.fill(Path(CGRect(origin: .zero, size: size)), with: .color(.white))

                
                    let orbs: [(CGPoint, CGFloat, Double)] = [
                        (.init(x: 0.02, y: 0.05),  0.55, 1.0),
                        (.init(x: 0.98, y: 0.05),  0.50, 0.8),
                        (.init(x: 0.05, y: 0.95),  0.52, 1.2),
                        (.init(x: 0.95, y: 0.95),  0.48, 0.7),
                    ]

                    for (i, orb) in orbs.enumerated() {
                        let fi    = Double(i)
                        let pulse = 1.0 + sin(t * orb.2 * 0.08 + fi) * 0.02
                        let cx    = (orb.0.x + sin(t * 0.025 + fi) * 0.02) * size.width
                        let cy    = (orb.0.y + cos(t * 0.020 + fi) * 0.02) * size.height
                        let r     = min(size.width, size.height) * orb.1 * pulse

                        canvas.blendMode = .normal
                        canvas.fill(
                            Path(ellipseIn: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2)),
                            with: .radialGradient(
                                Gradient(colors: [
                                    Color(white: 0.82, opacity: 0.50),
                                    Color(white: 0.90, opacity: 0.18),
                                    Color(white: 1.0,  opacity: 0.0),
                                ]),
                                center: .init(x: cx, y: cy), startRadius: 0, endRadius: r
                            )
                        )
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct DawnBackground: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        if reduceMotion {
            Color(hex: "#FFF8EE").ignoresSafeArea()
        } else {
            TimelineView(.animation(minimumInterval: 1/30)) { ctx in
                Canvas { canvas, size in
                    let t = ctx.date.timeIntervalSinceReferenceDate
                    canvas.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color(hex: "#FFF8EE")))
                    let orbs: [(CGPoint, Color, CGFloat, Double)] = [
                        (.init(x: 0.15, y: 0.20), Color(.systemOrange), 0.70, 1.0),
                        (.init(x: 0.85, y: 0.75), Color(.systemYellow), 0.60, 0.8),
                        (.init(x: 0.50, y: 0.55), Color(.systemPink),   0.50, 1.2),
                    ]
                    for (i, orb) in orbs.enumerated() {
                        let fi    = Double(i)
                        let pulse = 1.0 + sin(t * orb.3 * 0.12 + fi) * 0.05
                        let cx    = (orb.0.x + sin(t * 0.05 + fi * 1.5) * 0.04) * size.width
                        let cy    = (orb.0.y + cos(t * 0.04 + fi * 1.2) * 0.04) * size.height
                        let r     = min(size.width, size.height) * orb.2 * pulse
                        canvas.blendMode = .multiply
                        canvas.fill(
                            Path(ellipseIn: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2)),
                            with: .radialGradient(
                                Gradient(colors: [orb.1.opacity(0.22), orb.1.opacity(0.08), .clear]),
                                center: .init(x: cx, y: cy), startRadius: 0, endRadius: r
                            )
                        )
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}


struct BokehBackgroundView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color(hex: "05020a")
            
            GeometryReader { proxy in
                ForEach(0..<5) { i in
                    Circle()
                        .fill(orbColor(index: i))
                        .frame(width: CGFloat.random(in: 150...300))
                        .blur(radius: 60)
                        .opacity(0.4)
                        .position(
                            x: animate ? CGFloat.random(in: 0...proxy.size.width) : CGFloat.random(in: 0...proxy.size.width),
                            y: animate ? CGFloat.random(in: 0...proxy.size.height) : CGFloat.random(in: 0...proxy.size.height)
                        )
                        .animation(
                            Animation.linear(duration: Double.random(in: 10...20))
                                .repeatForever(autoreverses: true),
                            value: animate
                        )
                }
            }
        }
        .onAppear {
            animate.toggle()
        }
        .ignoresSafeArea()
        .accessibilityHidden(true)
    }
    
    private func orbColor(index: Int) -> Color {
        let colors = [
            Color(hex: "6a0dad"),
            Color(hex: "3b0087"),
            Color(hex: "b00b69"),
            Color(hex: "1a2a6c"),
            Color(hex: "4a0e8f")
        ]
        return colors[index % colors.count]
    }
}
