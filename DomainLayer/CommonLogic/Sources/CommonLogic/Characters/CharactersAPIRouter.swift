//
//  CharactersAPIRouter.swift
//  
//
//  Created by Artem on 29.05.2024.
//

import Foundation
import Networking

public final class CharactersAPIRouter: CharactersAPIRouterProtocol {
    private let apiClient: NetworkingInterface

    public init(apiClient: NetworkingInterface) {
        self.apiClient = apiClient
    }

    public func getAllCharacters() async throws -> Characters {
        let request = GetCharactersRequest()
        return try await apiClient.execute(request: request)
    }
    
    public func getCharacter(by id: Int) async throws -> Character {
        let request = GetSingleCharacterRequest(characterId: id)
        return try await apiClient.execute(request: request)
    }

    public func getNextPage(by stringUrl: String) async throws -> Characters {
        let request = GetNextPageRequest(nextPageUrl: stringUrl)
        return try await apiClient.execute(request: request)
    }
}
