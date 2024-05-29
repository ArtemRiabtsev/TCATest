//
//  File.swift
//  
//
//  Created by Artem on 29.05.2024.
//

import Foundation

// MARK: - Characters
public struct Characters: Decodable {
    public let info: Info
    public let results: [Character]
}

// MARK: - Info
public struct Info: Decodable {
    public let count, pages: Int
    public let next: String
}

// MARK: - Character
public struct Character: Decodable, Identifiable {
    public let id: Int
    public let name: String
    public let status: Status
    public let species: Species
    public let type: String
    public let gender: Gender
    public let origin, location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
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
