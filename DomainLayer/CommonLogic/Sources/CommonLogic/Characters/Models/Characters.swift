//
//  File.swift
//  
//
//  Created by Artem on 29.05.2024.
//

import Foundation

// MARK: - Characters
public struct Characters: Decodable, Equatable {
    public let info: Info
    public let results: [Character]
}

// MARK: - Info
public struct Info: Decodable, Equatable {
    public let count, pages: Int
    public let next: String?
    public let prev: String?
}

// MARK: - Character
public struct Character: Decodable, Identifiable, Equatable {
    public static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }

    public let id: Int
    public let name: String
    public let status: Status
    public let type: String
    public let gender: Gender
    public let origin, location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String

    public var imageUrl: URL? {
        URL(string: image)
    }
}

public enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
public struct Location: Decodable {
    let name: String
    let url: String
}

public enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

public enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

/// MARK: - Characters
//struct Characters: Codable {
//    let info: Info
//    let results: [Result]
//}
//
//// MARK: - Info
//struct Info: Codable {
//    let count, pages: Int
//    let next, prev: String
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let id: Int
//    let name: String
//    let status: Status
//    let species, type: String
//    let gender: Gender
//    let origin, location: Location
//    let image: String
//    let episode: [String]
//    let url: String
//    let created: String
//}
//
//enum Gender: String, Codable {
//    case female = "Female"
//    case male = "Male"
//    case unknown = "unknown"
//}
//
//// MARK: - Location
//struct Location: Codable {
//    let name: String
//    let url: String
//}
//
//enum Status: String, Codable {
//    case alive = "Alive"
//    case dead = "Dead"
//    case unknown = "unknown"
//}
