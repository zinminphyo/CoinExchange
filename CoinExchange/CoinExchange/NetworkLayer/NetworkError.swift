//
//  NetworkError.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation


enum NetworkError {
    case unauthorized
    case notFound
    case internalServerError
    case customError(Error)
}


extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "Unauthorized"
        case .notFound:
            return "Not Found"
        case .internalServerError:
            return "Internal Server Error"
        case .customError(let error):
            return error.localizedDescription
        }
    }
}
