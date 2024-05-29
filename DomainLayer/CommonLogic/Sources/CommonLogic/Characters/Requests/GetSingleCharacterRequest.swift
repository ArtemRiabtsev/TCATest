//
//  GetSingleCharacterRequest.swift
//
//
//  Created by Artem on 29.05.2024.
//

import Foundation
import Networking

public struct GetSingleCharacterRequest: RequestProvider {
    private let characterId: Int
    public var baseURL: String?

    public var path: String? {
        "/api/character/\(characterId)"
    }

    public init(characterId: Int) {
        self.characterId = characterId
    }
}
