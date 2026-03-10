//
//  AssessmentEntity.swift
//  Avello
//
//  Created by Aditya Chauhan on 10/03/26.
//

import Foundation

class Assessment {
    var id: String
    var userId: String
    var assessmentType: String
    var responses: [String: Int]
    var scores: [String: Double]
    var indicators: [String: String]
    var recommendations: [String]
    var requiresProfessionalReview: Bool
    var status: String
    var schemaVersion: String
    var startedAt: Date
    var completedAt: Date?

    init(id: String, userId: String, assessmentType: String) {
        self.id = id
        self.userId = userId
        self.assessmentType = assessmentType
        self.responses = [:]
        self.scores = [:]
        self.indicators = [:]
        self.recommendations = []
        self.requiresProfessionalReview = false
        self.status = "not_started"
        self.schemaVersion = "1.0"
        self.startedAt = Date()
    }
}

class AssessmentQuestion {
    var id: String
    var assessmentType: String
    var domain: String
    var questionText: String
    var questionNumber: Int
    var responseType: String
    var options: [ResponseOption]
    var helpText: String?
    var isReverseScored: Bool

    init(id: String, assessmentType: String, domain: String, questionText: String,
         questionNumber: Int, responseType: String, options: [ResponseOption]) {
        self.id = id
        self.assessmentType = assessmentType
        self.domain = domain
        self.questionText = questionText
        self.questionNumber = questionNumber
        self.responseType = responseType
        self.options = options
        self.isReverseScored = false
    }
}

class ResponseOption {
    var id: String
    var label: String
    var value: Int

    init(id: String, label: String, value: Int) {
        self.id = id
        self.label = label
        self.value = value
    }
}


//extension Assessment {
//    static var example: Assessment {
//        let assessment = Assessment(id: "asmnt_001", userId: "uid_001", assessmentType: "adhd_screening")
//        assessment.responses = ["adhd_q1": 3, "adhd_q2": 2, "adhd_q3": 3, "adhd_q4": 1]
//        assessment.scores = ["inattention": 22.0, "hyperactivity": 14.0]
//        assessment.indicators = ["inattention": "high", "hyperactivity": "moderate"]
//        assessment.recommendations = [
//            "Consider consulting a mental health professional for a full evaluation.",
//            "Try time-blocking strategies for tasks requiring sustained focus."
//        ]
//        assessment.status = "completed"
//        assessment.completedAt = Date()
//        return assessment
//    }
//}
//
//extension AssessmentQuestion {
//    static var example: AssessmentQuestion {
//        let options = [
//            ResponseOption(id: "opt_0", label: "Never", value: 0),
//            ResponseOption(id: "opt_1", label: "Sometimes", value: 1),
//            ResponseOption(id: "opt_2", label: "Often", value: 2),
//            ResponseOption(id: "opt_3", label: "Very Often", value: 3)
//        ]
//        return AssessmentQuestion(
//            id: "adhd_q1",
//            assessmentType: "adhd_screening",
//            domain: "inattention",
//            questionText: "How often do you have trouble wrapping up the final details of a project?",
//            questionNumber: 1,
//            responseType: "frequency",
//            options: options
//        )
//    }
//}
