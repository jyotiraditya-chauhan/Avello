//
//  TaskEntity.swift
//  Avello
//
//  Created by Aditya Chauhan on 10/03/26.
//

import Foundation

class TaskEntity {
    var id: String
    var userId: String
    var name: String
    var taskDescription: String?
    var category: TaskCategory
    var priority: TaskPriority
    var status: String
    var frequency: TaskFrequency
    var timeFlexibility: TimeFlexibility
    var subcategories: [String]
    var subtasks: [Subtask]
    var scheduledDate: String
    var scheduledStartTime: Date?
    var scheduledEndTime: Date?
    var estimatedDurationMinutes: Int
    var adhdConsiderations: TaskADHDConsiderations
    var emotionalCapacityWhenCreated: Int
    var completionAnalytics: TaskCompletionAnalytics?
    var aiReasoning: String?
    var aiSuggestedStartTime: Date?
    var reminderSet: Bool
    var reminderTime: Date?
    var recurrenceRule: RecurrenceRule?
    var groundingSessionUsedId: String?
    var completedInFocusPodId: String?
    var createdAt: Date
    var updatedAt: Date
    var completedAt: Date?
    var skippedAt: Date?
    var skipReason: String?

    init(id: String, userId: String, name: String, category: TaskCategory, priority: TaskPriority,
         scheduledDate: String, estimatedDurationMinutes: Int) {
        self.id = id
        self.userId = userId
        self.name = name
        self.category = category
        self.priority = priority
        self.status = "upcoming"
        self.frequency = .occasional
        self.timeFlexibility = .medium
        self.subcategories = []
        self.subtasks = []
        self.scheduledDate = scheduledDate
        self.estimatedDurationMinutes = estimatedDurationMinutes
        self.adhdConsiderations = TaskADHDConsiderations()
        self.emotionalCapacityWhenCreated = 5
        self.reminderSet = false
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}

class Subtask {
    var id: String
    var name: String
    var isCompleted: Bool
    var completedAt: Date?

    init(id: String, name: String) {
        self.id = id
        self.name = name
        self.isCompleted = false
    }
}

class TaskADHDConsiderations {
    var difficultyLevel: DifficultyLevel
    var requiresFocus: Bool
    var bestTime: BestTime
    var commonBlockers: [ADHDBlocker]
    var benefit: String?
    var tip: String?
    var breakIntoSubtasks: Bool
    var needsReminder: Bool
    var hasSocialComponent: Bool

    init() {
        self.difficultyLevel = .medium
        self.requiresFocus = false
        self.bestTime = .asScheduled
        self.commonBlockers = []
        self.breakIntoSubtasks = false
        self.needsReminder = true
        self.hasSocialComponent = false
    }
}

class TaskCompletionAnalytics {
    var actualDurationMinutes: Int?
    var emotionalCapacityAtCompletion: Int?
    var wasRescheduled: Bool
    var encounteredBlockers: [ADHDBlocker]
    var moodAfterCompletion: String?
    var difficultyRating: Int?

    init() {
        self.wasRescheduled = false
        self.encounteredBlockers = []
    }
}

class RecurrenceRule {
    var frequency: String
    var interval: Int
    var daysOfWeek: [Int]?
    var endDate: Date?

    init(frequency: String, interval: Int = 1) {
        self.frequency = frequency
        self.interval = interval
    }
}

enum TaskCategory: String {
    case academic = "Academic"
    case professional = "Professional"
    case household = "Household"
    case healthFitness = "Health & Fitness"
    case social = "Social"
    case financial = "Financial"
    case careerDevelopment = "Career Development"
    case creativeHobbies = "Creative & Hobbies"
    case administrative = "Administrative"
    case personalCare = "Personal Care"
}

enum TaskPriority: String {
    case high, medium, low
}

enum TimeFlexibility: String {
    case high, medium, low
}

enum DifficultyLevel: String {
    case low, medium, high
    case veryHigh = "very_high"
}

enum BestTime: String {
    case morning, afternoon, evening
    case whenMotivated = "when_motivated"
    case whenFresh = "when_fresh"
    case asScheduled = "as_scheduled"
}

enum ADHDBlocker: String {
    case taskInitiation = "task_initiation"
    case timeBlindness = "time_blindness"
    case executiveDysfunction = "executive_dysfunction"
    case perfectionism, overwhelm, procrastination
    case decisionParalysis = "decision_paralysis"
    case attentionDrift = "attention_drift"
    case hyperfocusRisk = "hyperfocus_risk"
    case rejectionSensitivity = "rejection_sensitivity"
    case fatigue, motivation
    case socialAnxiety = "social_anxiety"
}

enum TaskFrequency: String {
    case daily, weekly, monthly, yearly, semester, occasional, varies
}

//extension TaskEntity {
//    static var example: TaskEntity {
//        let task = TaskEntity(
//            id: "task_001",
//            userId: "uid_001",
//            name: "Submit assignment draft",
//            category: .academic,
//            priority: .high,
//            scheduledDate: "2025-11-12",
//            estimatedDurationMinutes: 90
//        )
//        task.taskDescription = "Submit the first draft of the research paper on Firestore to professor"
//        task.subcategories = ["Research", "Writing"]
//        task.subtasks = [
//            Subtask(id: "st_1", name: "Open document"),
//            Subtask(id: "st_2", name: "Write conclusion"),
//            Subtask(id: "st_3", name: "Upload to portal")
//        ]
//        task.emotionalCapacityWhenCreated = 6
//        task.reminderSet = true
//        task.aiReasoning = "Scheduled during your morning peak focus window based on past patterns."
//
//        let adhd = TaskADHDConsiderations()
//        adhd.difficultyLevel = .high
//        adhd.requiresFocus = true
//        adhd.bestTime = .morning
//        adhd.commonBlockers = [.taskInitiation, .perfectionism]
//        adhd.tip = "Open the document first before doing anything else — just getting started is the win."
//        adhd.breakIntoSubtasks = true
//        task.adhdConsiderations = adhd
//
//        return task
//    }
//}
//
//extension TaskCompletionAnalytics {
//    static var example: TaskCompletionAnalytics {
//        let analytics = TaskCompletionAnalytics()
//        analytics.actualDurationMinutes = 110
//        analytics.emotionalCapacityAtCompletion = 5
//        analytics.wasRescheduled = false
//        analytics.encounteredBlockers = [.taskInitiation, .attentionDrift]
//        analytics.moodAfterCompletion = "better"
//        analytics.difficultyRating = 4
//        return analytics
//    }
//}
