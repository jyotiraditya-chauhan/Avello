//
//  GroundingEntity.swift
//  Avello
//
//  Created by Aditya Chauhan on 10/03/26.
//

import Foundation

class GroundingTechnique {
    var id: String
    var name: String
    var tagline: String
    var type: String
    var intensityLevel: String
    var estimatedDurationSeconds: Int
    var steps: [TechniqueStep]
    var tags: [String]
    var requiredEquipment: [String]
    var evidenceBase: String
    var audioGuideURL: String?
    var animationName: String?
    var isActive: Bool
    var isAvailableOffline: Bool
    var createdAt: Date

    init(id: String, name: String, tagline: String, type: String, intensityLevel: String,
         estimatedDurationSeconds: Int, steps: [TechniqueStep], evidenceBase: String) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.type = type
        self.intensityLevel = intensityLevel
        self.estimatedDurationSeconds = estimatedDurationSeconds
        self.steps = steps
        self.evidenceBase = evidenceBase
        self.tags = []
        self.requiredEquipment = []
        self.isActive = true
        self.isAvailableOffline = true
        self.createdAt = Date()
    }
}

class TechniqueStep {
    var id: String
    var stepNumber: Int
    var instruction: String
    var durationSeconds: Int?
    var cueText: String?
    var hapticPattern: String?

    init(id: String, stepNumber: Int, instruction: String) {
        self.id = id
        self.stepNumber = stepNumber
        self.instruction = instruction
    }
}

class GroundingSession {
    var id: String
    var userId: String
    var techniqueId: String
    var techniqueName: String
    var triggeredBy: String
    var stressLevelBefore: Double?
    var stressLevelAfter: Double?
    var capacityBefore: Int?
    var capacityAfter: Int?
    var wasCompleted: Bool
    var effectivenessRating: Int?
    var linkedTaskId: String?
    var startedAt: Date
    var completedAt: Date?

    var durationSeconds: Int? {
        guard let end = completedAt else { return nil }
        return Int(end.timeIntervalSince(startedAt))
    }

    init(id: String, userId: String, techniqueId: String, techniqueName: String, triggeredBy: String) {
        self.id = id
        self.userId = userId
        self.techniqueId = techniqueId
        self.techniqueName = techniqueName
        self.triggeredBy = triggeredBy
        self.wasCompleted = false
        self.startedAt = Date()
    }
}

extension GroundingTechnique {
    static var example: GroundingTechnique {
        let steps = [
            TechniqueStep.make(id: "s1", number: 1, instruction: "Breathe in slowly through your nose", duration: 4, cue: "Breathe in...", haptic: "inhale"),
            TechniqueStep.make(id: "s2", number: 2, instruction: "Hold your breath gently", duration: 7, cue: "Hold...", haptic: "hold"),
            TechniqueStep.make(id: "s3", number: 3, instruction: "Exhale slowly through your mouth", duration: 8, cue: "Breathe out...", haptic: "exhale")
        ]
        let technique = GroundingTechnique(
            id: "gt_001",
            name: "4-7-8 Breathing",
            tagline: "Calm your nervous system in 60 seconds",
            type: "breathing",
            intensityLevel: "gentle",
            estimatedDurationSeconds: 60,
            steps: steps,
            evidenceBase: "Vagal nerve activation via extended exhale (Weil, 2015)"
        )
        technique.tags = ["breathing", "vagal", "quick", "anywhere"]
        technique.animationName = "breathing_circle"
        return technique
    }
}

extension TechniqueStep {
    static func make(id: String, number: Int, instruction: String, duration: Int? = nil, cue: String? = nil, haptic: String? = nil) -> TechniqueStep {
        let step = TechniqueStep(id: id, stepNumber: number, instruction: instruction)
        step.durationSeconds = duration
        step.cueText = cue
        step.hapticPattern = haptic
        return step
    }
}

extension GroundingSession {
    static var example: GroundingSession {
        let session = GroundingSession(
            id: "gs_001",
            userId: "uid_001",
            techniqueId: "gt_001",
            techniqueName: "4-7-8 Breathing",
            triggeredBy: "overwhelm_detected"
        )
        session.stressLevelBefore = 0.78
        session.stressLevelAfter = 0.41
        session.capacityBefore = 3
        session.capacityAfter = 5
        session.wasCompleted = true
        session.effectivenessRating = 4
        session.completedAt = Date().addingTimeInterval(60)
        return session
    }
}
