//
//  GetCharactersRequest.swift
//
//
//  Created by Artem on 29.05.2024.
//

import Foundation
import Networking

public struct GetCharactersRequest: RequestProvider {
    public var baseURL: String?
    public var path: String? {
        "/api/character"
    }
}
