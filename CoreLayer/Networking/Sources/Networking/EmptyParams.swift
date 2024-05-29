//
//  EmptyParams.swift
//
//
//  Created by Artem on 28.05.2024.
//

import Foundation

public struct EmptyRequestParams: RequestInput {
    public init() {}
}

public struct EmptyResponse: Decodable {
    public init() {}
}
