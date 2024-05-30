//
//  CharactersFeedView.swift
//
//
//  Created by Artem on 30.05.2024.
//

import SwiftUI
import ComposableArchitecture
import NukeUI
import Nuke
import CommonLogic

public struct CharactersFeedView: View {
    private enum Constants {
        static let imageHeight: CGFloat = 150
        static let imageWidth: CGFloat = imageHeight
    }

    private let store: StoreOf<CharactersFeed>

    public init(store: StoreOf<CharactersFeed>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(viewStore.charactersList.indices, id: \.self) { index in
                            NavigationLink {
                                CharacterDetailsView(
                                    store: .init(
                                        initialState: .init(characterId: viewStore.charactersList[index].id),
                                        reducer: { CharacterDetails() }
                                    )
                                )
                            } label: {
                                makeCharacterView(viewStore.charactersList[index])
                            }
                            .onAppear {
                                viewStore.send(.handleNextIndex(index))
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }

    @MainActor
    private func makeCharacterView(_ character: Character) -> some View {
        HStack {
            makeImage(character.imageUrl)
            VStack {
                Text(character.name)
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(character.status.rawValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }

    @MainActor
    private func makeImage(_ url: URL?) -> some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image.resizable().aspectRatio(contentMode: .fit)
            }
        }
        .pipeline(ImagePipeline.shared)
        .frame(maxHeight: Constants.imageHeight)
    }
}

#Preview {
    CharactersFeedView(store: .init(initialState: .init(), reducer: { CharactersFeed() }))
}
