//
//  CharacterDetailsView.swift
//
//
//  Created by Artem on 30.05.2024.
//

import SwiftUI
import ComposableArchitecture
import Nuke
import NukeUI
import CommonLogic

struct CharacterDetailsView: View {
    private let store: StoreOf<CharacterDetails>

    public init(store: StoreOf<CharacterDetails>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            infoView(character: viewStore.details)
            .padding()
            .onAppear {
                store.send(.onAppear)
            }
        }
    }

    @MainActor
    private func infoView(character: Character?) -> some View {
        VStack {
            if let details = character {
                makeImage(details.imageUrl)
                Text(details.name )
                Text(details.status.rawValue)
                Text(details.type)
            } else {
                Text("No info found")
            }
        }
    }

    @MainActor
    private func makeImage(_ url: URL?) -> some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image.resizable().aspectRatio(contentMode: .fit)
            }
        }
        .pipeline(ImagePipeline.shared)
    }
}

#Preview {
    CharacterDetailsView(store: .init(initialState: .init(characterId: 1), reducer: { CharacterDetails() }))
}
