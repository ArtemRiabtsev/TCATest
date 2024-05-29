//
//  APIClient.swift
//  
//
//  Created by Artem on 28.05.2024.
//

import Foundation

final public class APIClient: NetworkingInterface {
    private let session: URLSession

    public init(session: URLSession? = nil) {
        self.session = session ?? URLSession(configuration: .default)
    }

    public func execute<T>(request: URLRequest) async throws -> T where T : Decodable {
        let (data, response) = try await session.data(for: request)
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
}
