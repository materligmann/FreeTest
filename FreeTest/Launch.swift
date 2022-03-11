//
//  Model.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import Foundation

struct Launch: Codable {
    let name: String
    let date_utc: String
    let date_unix: Double
    let success: Bool?
    let details: String?
    let links: Links?
}

struct Links: Codable {
    let patch: Patch?
}

struct Patch: Codable {
    let small: String?
    let large: String?
}


