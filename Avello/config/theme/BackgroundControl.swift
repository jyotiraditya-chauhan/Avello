//
//  BackgroundControl.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import SwiftUI

private struct BackgroundVisibleKey: EnvironmentKey {
    static let defaultValue: Bool = true
}

extension EnvironmentValues {
    var isBackgroundVisible: Bool {
        get { self[BackgroundVisibleKey.self] }
        set { self[BackgroundVisibleKey.self] = newValue }
    }
}

extension View {
    func showBackground(_ visible: Bool) -> some View {
        environment(\.isBackgroundVisible, visible)
    }
}
