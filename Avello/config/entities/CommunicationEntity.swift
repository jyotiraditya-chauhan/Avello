//
//  CommunicationEntity.swift
//  Avello
//
//  Created by Aditya Chauhan on 10/03/26.
//

import Foundation

class CommunityGroup {
    var id: String
    var name: String
    var description: String
    var tags: [String]
    var memberIds: [String]
    var adminId: String
    var inviteCode: String
    var isPublic: Bool
    var currentActivePodId: String?
    var lastActivityAt: Date
    var createdAt: Date

    var isFull: Bool { memberIds.count >= 8 }

    init(id: String, name: String, description: String, adminId: String, inviteCode: String) {
        self.id = id
        self.name = name
        self.description = description
        self.tags = []
        self.memberIds = [adminId]
        self.adminId = adminId
        self.inviteCode = inviteCode
        self.isPublic = false
        self.lastActivityAt = Date()
        self.createdAt = Date()
    }
}

class GroupMember {
    var id: String
    var groupId: String
    var role: String
    var displayName: String
    var joinedAt: Date
    var lastSeenAt: Date
    var totalFocusMinutesInGroup: Int
    var presenceStatus: String

    init(id: String, groupId: String, role: String, displayName: String) {
        self.id = id
        self.groupId = groupId
        self.role = role
        self.displayName = displayName
        self.joinedAt = Date()
        self.lastSeenAt = Date()
        self.totalFocusMinutesInGroup = 0
        self.presenceStatus = "offline"
    }
}

class FocusPod {
    var id: String
    var groupId: String
    var hostId: String
    var name: String
    var intention: String
    var podType: String
    var status: String
    var currentPhase: String

    var workDurationMinutes: Int
    var breakDurationMinutes: Int
    var totalCycles: Int
    var currentCycle: Int
    var phaseEndsAt: Date?

    var participants: [PodParticipant]
    var ambientSoundId: String?
    var isTaskSharingEnabled: Bool

    var scheduledFor: Date
    var startedAt: Date?
    var endedAt: Date?
    var createdAt: Date

    var isLive: Bool { status == "active" }

    init(id: String, groupId: String, hostId: String, name: String, intention: String, scheduledFor: Date) {
        self.id = id
        self.groupId = groupId
        self.hostId = hostId
        self.name = name
        self.intention = intention
        self.podType = "silent"
        self.status = "scheduled"
        self.currentPhase = "countdown"
        self.workDurationMinutes = 25
        self.breakDurationMinutes = 5
        self.totalCycles = 4
        self.currentCycle = 0
        self.participants = []
        self.isTaskSharingEnabled = false
        self.scheduledFor = scheduledFor
        self.createdAt = Date()
    }
}

class PodParticipant {
    var id: String
    var displayName: String
    var status: String
    var taskForThisSession: String?
    var tasksCompletedCount: Int
    var joinedAt: Date
    var leftAt: Date?

    init(id: String, displayName: String) {
        self.id = id
        self.displayName = displayName
        self.status = "idle"
        self.tasksCompletedCount = 0
        self.joinedAt = Date()
    }
}

//extension CommunityGroup {
//    static var example: CommunityGroup {
//        let group = CommunityGroup(
//            id: "grp_001",
//            name: "Late Night Grinders",
//            description: "College students getting stuff done together after 10pm",
//            adminId: "uid_001",
//            inviteCode: "LNG42X"
//        )
//        group.tags = ["students", "night_owls", "engineering"]
//        group.memberIds = ["uid_001", "uid_002", "uid_003"]
//        group.isPublic = true
//        return group
//    }
//}
//
//extension FocusPod {
//    static var example: FocusPod {
//        let pod = FocusPod(
//            id: "pod_001",
//            groupId: "grp_001",
//            hostId: "uid_001",
//            name: "Sunday Deep Work",
//            intention: "Finishing assignments before Monday",
//            scheduledFor: Date().addingTimeInterval(600)
//        )
//        pod.podType = "accountability"
//        pod.workDurationMinutes = 25
//        pod.breakDurationMinutes = 5
//        pod.totalCycles = 4
//        pod.isTaskSharingEnabled = true
//        pod.participants = [
//            PodParticipant.make(id: "uid_001", name: "Riya", task: "Submit assignment draft"),
//            PodParticipant.make(id: "uid_002", name: "Arjun", task: "Complete math problem set")
//        ]
//        return pod
//    }
//}
//
//extension PodParticipant {
//    static func make(id: String, name: String, task: String? = nil) -> PodParticipant {
//        let p = PodParticipant(id: id, displayName: name)
//        p.taskForThisSession = task
//        p.status = "focusing"
//        return p
//    }
//}
