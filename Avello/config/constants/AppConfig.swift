//
//  AppConfig.swift
//  Avello
//
//  Created by Aditya Chauhan on 10/03/26.
//


import Foundation

enum AppCollections {
    static let users                = "users"
    static let assessments          = "assessments"
    static let tasks                = "tasks"
    static let dailyCapacity        = "daily_capacity"
    static let groundingSessions    = "grounding_sessions"
    static let groundingTechniques  = "grounding_techniques"
    static let assessmentQuestions  = "assessment_questions"
    static let dashboard            = "dashboard"
    static let communityGroups      = "community_groups"
    static let groupMembers         = "members"
    static let focusPods            = "focus_pods"
}

enum FirestorePath {

    enum Users {
        static let collection = AppCollections.users
        static func document(_ uid: String) -> String { "users/\(uid)" }
    }

    enum Assessments {
        static let collection = AppCollections.assessments
        static func document(_ docId: String) -> String { "assessments/\(docId)" }
    }

    enum Tasks {
        static let collection = AppCollections.tasks
        static func document(_ docId: String) -> String { "tasks/\(docId)" }
    }

    enum DailyCapacity {
        static let collection = AppCollections.dailyCapacity
        static func document(_ docId: String) -> String { "daily_capacity/\(docId)" }
    }

    enum GroundingSessions {
        static let collection = AppCollections.groundingSessions
        static func document(_ docId: String) -> String { "grounding_sessions/\(docId)" }
    }

    enum Dashboard {
        static let collection = AppCollections.dashboard
        static func document(_ uid: String) -> String { "dashboard/\(uid)" }
    }

    enum GroundingTechniques {
        static let collection = AppCollections.groundingTechniques
        static func document(_ docId: String) -> String { "grounding_techniques/\(docId)" }
    }

    enum AssessmentQuestions {
        static let collection = AppCollections.assessmentQuestions
        static func document(_ docId: String) -> String { "assessment_questions/\(docId)" }
    }

    enum CommunityGroups {
        static let collection = AppCollections.communityGroups
        static func document(_ gid: String) -> String { "community_groups/\(gid)" }
    }

    enum GroupMembers {
        static let collection = AppCollections.groupMembers
        static func document(_ gid: String, _ uid: String) -> String { "community_groups/\(gid)/members/\(uid)" }
    }

    enum FocusPods {
        static let collection = AppCollections.focusPods
        static func document(_ gid: String, _ podId: String) -> String { "community_groups/\(gid)/focus_pods/\(podId)" }
    }
}
