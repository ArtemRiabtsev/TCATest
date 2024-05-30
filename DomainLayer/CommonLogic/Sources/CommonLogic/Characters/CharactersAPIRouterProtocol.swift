//
//  CharactersAPIRouterProtocol.swift
//
//
//  Created by Artem on 29.05.2024.
//

import Foundation

public protocol CharactersAPIRouterProtocol {
    func getAllCharacters() async throws -> Characters
    func getCharacter(by id: Int) async throws -> Character
    func getNextPage(by stringUrl: String) async throws -> Characters
}
