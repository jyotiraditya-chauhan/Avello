//
//  TransparentContainers.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import SwiftUI

private struct ClearUIKitBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = BackgroundClearingView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    private final class BackgroundClearingView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            guard window != nil else { return }
            var current: UIView? = superview
            while let view = current {
                view.backgroundColor = .clear
                current = view.superview
            }
        }
    }
}


extension View {
    func transparentContainer() -> some View {
        background(ClearUIKitBackground())
    }

    func transparentNavigation() -> some View {
        scrollContentBackground(.hidden)
            .toolbarBackground(.hidden, for: .navigationBar)
            .transparentContainer()
    }

    func transparentTabBar() -> some View {
        toolbarBackground(.hidden, for: .tabBar)
            .transparentContainer()
    }
}
