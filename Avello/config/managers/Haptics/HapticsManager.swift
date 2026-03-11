//
//  HapticsManager.swift
//  Avello
//
//  Created by Aditya Chauhan on 11/03/26.
//

import Foundation
import SwiftUI
import UIKit

class HapticManager {
    static let shared = HapticManager()
    private init() {}
    func trigger(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}
