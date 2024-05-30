//
//  CharacterDetails.swift
//
//
//  Created by Artem on 30.05.2024.
//

import ComposableArchitecture
import CommonLogic

public struct CharacterDetails: Reducer {
    @Dependency(\.charactersAPIRouter) var charactersAPIRouter

    public struct State: Equatable {
        let characterId: Int
        public var details: Character?

        public init(characterId: Int) {
            self.characterId = characterId
        }
    }

    public enum Action {
        case onAppear
        case onUpdateCharacterDetails(Character)
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                let id = state.characterId
                return .run { send in
                    let character = try await charactersAPIRouter.getCharacter(by: id)
                    await send(.onUpdateCharacterDetails(character))
                }
            case .onUpdateCharacterDetails(let character):
                state.details = character
                return .none
            }
        }
    }
}
