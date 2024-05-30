//
//  File.swift
//  
//
//  Created by Artem on 30.05.2024.
//

import Foundation
import Networking

public struct GetNextPageRequest: RequestProvider {    
    public var baseURL: String?
    public var path: String? {
        guard let path = extractedPath else { return nil }
        return "\(path)"
    }

    public var queryItems: [URLQueryItem]? {
        extractedQueryItems
    }

    private let extractedPath: String?
    private let extractedQueryItems: [URLQueryItem]?

    public init(nextPageUrl: String) {
        let urlComponents = URLComponents(string: nextPageUrl)
        extractedPath = urlComponents?.path
        extractedQueryItems = urlComponents?.queryItems

    }
}
