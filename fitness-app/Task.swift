//
//  TaskModel.swift
//  fitness-app
//
//  Created by Asista Mac Mini on 12/06/21.
//

import Foundation

// MARK: - TaskModel
public struct TaskModel: Codable {
    public let tasks: [Task]

    enum CodingKeys: String, CodingKey {
        case tasks = "tasks"
    }

    public init(tasks: [Task]) {
        self.tasks = tasks
    }
}

// MARK: - Task
public struct Task: Codable {
    public let taskCD: String
    public let type: String
    public let frequency: Int
    public let duration: Int
    public let scheduleList: [ScheduleList]
    public let drug: Drug?
    public let video: Video?

    enum CodingKeys: String, CodingKey {
        case taskCD = "taskCd"
        case type = "type"
        case frequency = "frequency"
        case duration = "duration"
        case scheduleList = "scheduleList"
        case drug = "drug"
        case video = "video"
    }

    public init(taskCD: String, type: String, frequency: Int, duration: Int, scheduleList: [ScheduleList], drug: Drug?, video: Video?) {
        self.taskCD = taskCD
        self.type = type
        self.frequency = frequency
        self.duration = duration
        self.scheduleList = scheduleList
        self.drug = drug
        self.video = video
    }
}

// MARK: - Drug
public struct Drug: Codable {
    public let brandNm: String
    public let genericNm: String
    public let qty: Int
    public let dosage: Dosage

    enum CodingKeys: String, CodingKey {
        case brandNm = "brandNm"
        case genericNm = "genericNm"
        case qty = "qty"
        case dosage = "dosage"
    }

    public init(brandNm: String, genericNm: String, qty: Int, dosage: Dosage) {
        self.brandNm = brandNm
        self.genericNm = genericNm
        self.qty = qty
        self.dosage = dosage
    }
}

// MARK: - Dosage
public struct Dosage: Codable {
    public let dose: Int
    public let unit: String

    enum CodingKeys: String, CodingKey {
        case dose = "dose"
        case unit = "unit"
    }

    public init(dose: Int, unit: String) {
        self.dose = dose
        self.unit = unit
    }
}

// MARK: - ScheduleList
public struct ScheduleList: Codable {
    public let session: String
    public let foodContext: String

    enum CodingKeys: String, CodingKey {
        case session = "session"
        case foodContext = "foodContext"
    }

    public init(session: String, foodContext: String) {
        self.session = session
        self.foodContext = foodContext
    }
}

// MARK: - Video
public struct Video: Codable {
    public let title: String
    public let hlsURL: String
    public let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case hlsURL = "hlsUrl"
        case thumbnail = "thumbnail"
    }

    public init(title: String, hlsURL: String, thumbnail: String) {
        self.title = title
        self.hlsURL = hlsURL
        self.thumbnail = thumbnail
    }
}
