//
//  TCATestApp.swift
//  TCATest
//
//  Created by Artem on 28.05.2024.
//

import SwiftUI
import Characters

@main
struct TCATestApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersFeedView(store: .init(initialState: .init(), reducer: { CharactersFeed() }))
        }
    }
}
