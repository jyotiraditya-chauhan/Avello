//
//  UserEntity.swift
//  Avello
//
//  Created by Aditya Chauhan on 10/03/26.
//

import Foundation


class UserEntity {
    var id: String
    var name: String
    var email: String
    var profileImageURL: String?
    var dateOfBirth: Date?
    var onboardingCompleted: Bool
    var onboardingStep: String
    var adhdProfile: ADHDProfile?
    var preferences: UserPreferences
    var createdAt: Date
    var updatedAt: Date

    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
        self.onboardingCompleted = false
        self.onboardingStep = "welcome"
        self.preferences = UserPreferences()
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}



class ADHDProfile {
    var primaryType: String
    var severityLevel: String
    var dominantChallenges: [String]
    var lastAssessedAt: Date

    init(primaryType: String, severityLevel: String, dominantChallenges: [String]) {
        self.primaryType = primaryType
        self.severityLevel = severityLevel
        self.dominantChallenges = dominantChallenges
        self.lastAssessedAt = Date()
    }
}



class UserPreferences {
    var notificationsEnabled: Bool = true
    var reminderLeadTimeMinutes: Int = 15
    var dailyCheckInTime: String = "08:30"
    var hapticFeedbackEnabled: Bool = true
    var darkModePreference: String = "system"
    var preferredAIModel: String = "auto"
    var preferredGroundingTypes: [String] = []
}




class DailyCapacity {
    var id: String
    var userId: String
    var date: String
    var capacityLevel: Int
    var emotionalState: String
    var physicalState: String
    var sleepQuality: String?
    var notes: String?
    var recordedAt: Date

    init(id: String, userId: String, date: String, capacityLevel: Int, emotionalState: String, physicalState: String) {
        self.id = id
        self.userId = userId
        self.date = date
        self.capacityLevel = capacityLevel
        self.emotionalState = emotionalState
        self.physicalState = physicalState
        self.recordedAt = Date()
    }
}



//extension UserEntity {
//    static var example: UserEntity {
//        let user = UserEntity(id: "uid_001", name: "Riya Sharma", email: "riya@example.com")
//        user.dateOfBirth = Calendar.current.date(from: DateComponents(year: 2003, month: 4, day: 12))
//        user.onboardingCompleted = true
//        user.onboardingStep = "complete"
//        user.adhdProfile = ADHDProfile.example
//        user.preferences.dailyCheckInTime = "09:00"
//        user.preferences.preferredAIModel = "claude"
//        return user
//    }
//}
//
//extension ADHDProfile {
//    static var example: ADHDProfile {
//        ADHDProfile(
//            primaryType: "combined",
//            severityLevel: "moderate",
//            dominantChallenges: ["task_initiation", "time_blindness", "overwhelm"]
//        )
//    }
//}
//
//extension DailyCapacity {
//    static var example: DailyCapacity {
//        DailyCapacity(
//            id: "cap_001",
//            userId: "uid_001",
//            date: "2025-11-12",
//            capacityLevel: 6,
//            emotionalState: "anxious",
//            physicalState: "tired"
//        )
//    }
//}
