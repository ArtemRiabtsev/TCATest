//
//  RequestProvider.swift
//
//
//  Created by Artem on 28.05.2024.
//

import Foundation

public enum HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

public protocol RequestInput: Encodable { }

public protocol RequestProvider {
    var baseURL: String? { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

public extension RequestProvider {
    var path: String? { nil }
    var method: HTTPMethod {
        return .get
    }

    func asURLRequest() throws -> URLRequest {
        guard
            let baseURL = self.baseURL,
            var url = URL(string: baseURL)
        else {
            throw APIError.someAPIError
        }

        if let path = self.path {
            url.appendPathComponent(path)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request

    }
}
