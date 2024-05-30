//
//  Dependencies.swift
//
//
//  Created by Artem on 29.05.2024.
//

import Foundation
import Dependencies
import Networking
import CommonLogic

enum CharactersKey: DependencyKey {
    static var liveValue: CharactersAPIRouterProtocol = CharactersAPIRouter(apiClient: APIClient())
}

extension DependencyValues {
    var charactersAPIRouter: CharactersAPIRouterProtocol {
        get { self[CharactersKey.self] }
        set { self[CharactersKey.self] = newValue }
    }
}
