//
//  APIClient.swift
//  
//
//  Created by Artem on 28.05.2024.
//

import Foundation

final public class APIClient: NetworkingInterface {
    private let session: URLSession

    var baseURL: String {
        "https://rickandmortyapi.com"
    }

    public init(session: URLSession? = nil) {
        self.session = session ?? URLSession(configuration: .default)
    }

    public func execute<T>(request: RequestProvider) async throws -> T where T : Decodable {
        let updatedRequest = updateBaseURLIfEmpty(forRequest: request)
        let (data, response) = try await session.data(for: updatedRequest.asURLRequest())

        return try handeleResponse(data: data, response: response)
    }

    private func handeleResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw APIError.someAPIError
        }
        switch response.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw APIError.decodingError(description: error.localizedDescription)
            }
        default:
            throw APIError.someAPIError
        }
    }

    private func updateBaseURLIfEmpty<R>(forRequest request: R) -> R where R: RequestProvider {
        var request = request

        // if no baseURL was provided for specific request, general base url for this api session is used.
        if request.baseURL == nil {
            request.baseURL = self.baseURL
        }

        return request
    }
}
