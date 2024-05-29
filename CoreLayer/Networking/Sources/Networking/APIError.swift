//
//  APIError.swift
//  
//
//  Created by Artem on 28.05.2024.
//

import Foundation

public enum APIError: Error {
    case decodingError(description: String)
    case someAPIError
}
