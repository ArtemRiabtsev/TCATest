// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public protocol NetworkingInterface {
    func execute<T: Decodable>(request: RequestProvider) async throws -> T
}
