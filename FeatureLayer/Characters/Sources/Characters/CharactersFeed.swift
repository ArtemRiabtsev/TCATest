// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import CommonLogic

public struct CharactersFeed: Reducer {
    @Dependency(\.charactersAPIRouter) var charactersAPIRouter
    public struct State: Equatable {
        var characters: Characters?
        public var charactersList: [Character]

        public init() {
            charactersList = []
        }
    }

    public enum Action {
        case onAppear
        case onUpdateCharacters(Characters)
        case handleNextIndex(Int)
    }

    public init() {}

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    do {
                        let characters = try await charactersAPIRouter.getAllCharacters()
                        await send(.onUpdateCharacters(characters))
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                }
            case .onUpdateCharacters(let characters):
                state.characters = characters
                state.charactersList.append(contentsOf: characters.results)
                return .none
            case .handleNextIndex(let currentIndex):
                let shouldLoadNextPage = currentIndex == state.charactersList.count - 1
                if shouldLoadNextPage {
                    guard let nextPageUrl = state.characters?.info.next else { return .none }
                    return .run { send in
                        do {
                            let characters = try await charactersAPIRouter.getNextPage(by: nextPageUrl)
                            await send(.onUpdateCharacters(characters))
                        } catch {
                            debugPrint(error.localizedDescription)
                        }
                    }
                }
                return .none
            }
        }
    }
}
