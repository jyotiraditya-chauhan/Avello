//
//  AnalyticsEntity.swift
//  Avello
//
//  Created by Aditya Chauhan on 10/03/26.
//

import Foundation

class UserDashboard {
    var userId: String
    var weeklySnapshot: WeeklySnapshot
    var capacityTrend: CapacityTrend
    var taskAnalytics: TaskAnalytics
    var groundingAnalytics: GroundingAnalytics
    var communityAnalytics: CommunityAnalytics
    var streaks: StreakData
    var insights: [DashboardInsight]
    var lastComputedAt: Date

    init(userId: String) {
        self.userId = userId
        self.weeklySnapshot = WeeklySnapshot()
        self.capacityTrend = CapacityTrend()
        self.taskAnalytics = TaskAnalytics()
        self.groundingAnalytics = GroundingAnalytics()
        self.communityAnalytics = CommunityAnalytics()
        self.streaks = StreakData()
        self.insights = []
        self.lastComputedAt = Date()
    }
}

class WeeklySnapshot {
    var weekStartDate: String = ""
    var averageCapacityLevel: Double = 0
    var capacityByDay: [String: Int] = [:]
    var moodDistribution: [String: Int] = [:]
    var totalTasksCreated: Int = 0
    var totalTasksCompleted: Int = 0
    var totalTasksSkipped: Int = 0
    var taskCompletionRate: Double = 0
    var taskInitiationRate: Double = 0
    var totalFocusMinutes: Int = 0
    var groundingSessionsCount: Int = 0
    var bestFocusDay: String? = nil
}

class CapacityTrend {
    var last30Days: [String: Int] = [:]
    var averageLast7Days: Double = 0
    var averageLast30Days: Double = 0
    var trendDirection: String = "stable"
    var peakCapacityTimeOfDay: String? = nil
    var lowCapacityTimeOfDay: String? = nil
    var predictedCapacityTomorrow: Int? = nil
}

class TaskAnalytics {
    var completionRateByPriority: [String: Double] = [:]
    var averageCompletionDifficulty: Double = 0
    var mostProductiveHour: Int? = nil
    var mostProductiveDayOfWeek: Int? = nil
    var averageTaskDurationMinutes: Double = 0
    var rescheduleRate: Double = 0
    var topSkipReasons: [String: Int] = [:]
    var completionByCategory: [String: Double] = [:]
}

class GroundingAnalytics {
    var totalSessionsAllTime: Int = 0
    var totalMinutesAllTime: Int = 0
    var sessionsLast30Days: Int = 0
    var averageEffectivenessRating: Double = 0
    var averageStressReduction: Double = 0
    var mostUsedTechniqueId: String? = nil
    var mostUsedTechniqueName: String? = nil
    var techniqueUsageBreakdown: [String: Int] = [:]
    var triggerBreakdown: [String: Int] = [:]
}

class CommunityAnalytics {
    var totalFocusPodMinutes: Int = 0
    var totalPodsJoined: Int = 0
    var totalGroupsJoined: Int = 0
    var currentGroupIds: [String] = []
    var badgesEarned: [CommunityBadge] = []
}

class CommunityBadge {
    var id: String
    var name: String
    var iconName: String
    var earnedAt: Date

    init(id: String, name: String, iconName: String) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.earnedAt = Date()
    }
}

class StreakData {
    var checkInStreak: Int = 0
    var checkInLongestStreak: Int = 0
    var taskCompletionStreak: Int = 0
    var groundingStreak: Int = 0
    var focusPodStreak: Int = 0
    var lastCheckInDate: String? = nil
}

class DashboardInsight {
    var id: String
    var title: String
    var body: String
    var type: String
    var priority: Int
    var actionLabel: String?
    var actionDeepLink: String?
    var isRead: Bool
    var generatedAt: Date
    var expiresAt: Date?

    init(id: String, title: String, body: String, type: String, priority: Int) {
        self.id = id
        self.title = title
        self.body = body
        self.type = type
        self.priority = priority
        self.isRead = false
        self.generatedAt = Date()
    }
}

//extension UserDashboard {
//    static var example: UserDashboard {
//        let dashboard = UserDashboard(userId: "uid_001")
//
//        dashboard.weeklySnapshot.weekStartDate = "2025-11-10"
//        dashboard.weeklySnapshot.averageCapacityLevel = 6.2
//        dashboard.weeklySnapshot.capacityByDay = [
//            "2025-11-10": 5, "2025-11-11": 4, "2025-11-12": 6,
//            "2025-11-13": 7, "2025-11-14": 8, "2025-11-15": 6, "2025-11-16": 7
//        ]
//        dashboard.weeklySnapshot.moodDistribution = ["calm": 3, "anxious": 2, "content": 2]
//        dashboard.weeklySnapshot.totalTasksCreated = 18
//        dashboard.weeklySnapshot.totalTasksCompleted = 12
//        dashboard.weeklySnapshot.totalTasksSkipped = 3
//        dashboard.weeklySnapshot.taskCompletionRate = 0.67
//        dashboard.weeklySnapshot.taskInitiationRate = 0.83
//        dashboard.weeklySnapshot.totalFocusMinutes = 210
//        dashboard.weeklySnapshot.groundingSessionsCount = 5
//        dashboard.weeklySnapshot.bestFocusDay = "2025-11-14"
//
//        dashboard.capacityTrend.averageLast7Days = 6.1
//        dashboard.capacityTrend.averageLast30Days = 5.8
//        dashboard.capacityTrend.trendDirection = "improving"
//        dashboard.capacityTrend.peakCapacityTimeOfDay = "09:30"
//        dashboard.capacityTrend.lowCapacityTimeOfDay = "14:30"
//        dashboard.capacityTrend.predictedCapacityTomorrow = 7
//
//        dashboard.taskAnalytics.completionRateByPriority = ["high": 0.85, "medium": 0.60, "low": 0.40]
//        dashboard.taskAnalytics.averageCompletionDifficulty = 3.2
//        dashboard.taskAnalytics.mostProductiveHour = 9
//        dashboard.taskAnalytics.mostProductiveDayOfWeek = 2
//        dashboard.taskAnalytics.rescheduleRate = 0.15
//        dashboard.taskAnalytics.topSkipReasons = ["overwhelmed": 2, "low_capacity": 1]
//
//        dashboard.groundingAnalytics.totalSessionsAllTime = 23
//        dashboard.groundingAnalytics.totalMinutesAllTime = 115
//        dashboard.groundingAnalytics.sessionsLast30Days = 14
//        dashboard.groundingAnalytics.averageEffectivenessRating = 4.1
//        dashboard.groundingAnalytics.averageStressReduction = 0.34
//        dashboard.groundingAnalytics.mostUsedTechniqueId = "gt_001"
//        dashboard.groundingAnalytics.mostUsedTechniqueName = "4-7-8 Breathing"
//        dashboard.groundingAnalytics.techniqueUsageBreakdown = ["gt_001": 12, "gt_002": 7, "gt_003": 4]
//        dashboard.groundingAnalytics.triggerBreakdown = ["manual": 10, "overwhelm_detected": 8, "task_preparation": 5]
//
//        dashboard.communityAnalytics.totalFocusPodMinutes = 300
//        dashboard.communityAnalytics.totalPodsJoined = 8
//        dashboard.communityAnalytics.totalGroupsJoined = 2
//        dashboard.communityAnalytics.currentGroupIds = ["grp_001"]
//        dashboard.communityAnalytics.badgesEarned = [
//            CommunityBadge(id: "badge_001", name: "First Pod", iconName: "ic_pod_first"),
//            CommunityBadge(id: "badge_002", name: "7-Day Streak", iconName: "ic_streak_7")
//        ]
//
//        dashboard.streaks.checkInStreak = 9
//        dashboard.streaks.checkInLongestStreak = 14
//        dashboard.streaks.taskCompletionStreak = 5
//        dashboard.streaks.groundingStreak = 3
//        dashboard.streaks.focusPodStreak = 2
//        dashboard.streaks.lastCheckInDate = "2025-11-16"
//
//        dashboard.insights = [
//            DashboardInsight.make(
//                id: "ins_001",
//                title: "You focus best at 9 AM",
//                body: "Your task completion rate is 85% higher in the 9-10 AM window. Try scheduling high-priority tasks here.",
//                type: "capacity_pattern",
//                priority: 1,
//                actionLabel: "Schedule tasks",
//                deepLink: "avelo://tasks/schedule"
//            ),
//            DashboardInsight.make(
//                id: "ins_002",
//                title: "Breathing is working for you",
//                body: "4-7-8 Breathing has reduced your stress level by an average of 34% per session this week.",
//                type: "grounding_recommendation",
//                priority: 2
//            )
//        ]
//
//        return dashboard
//    }
//}
//
//extension DashboardInsight {
//    static func make(id: String, title: String, body: String, type: String, priority: Int,
//                     actionLabel: String? = nil, deepLink: String? = nil) -> DashboardInsight {
//        let insight = DashboardInsight(id: id, title: title, body: body, type: type, priority: priority)
//        insight.actionLabel = actionLabel
//        insight.actionDeepLink = deepLink
//        return insight
//    }
//}
