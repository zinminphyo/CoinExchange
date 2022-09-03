//
//  ApiRouter.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation
import Alamofire


enum ApiRouter: URLConvertible {
    
    case getCurrentPrice
    
    /// URL Convertable conformance.
    func asURL() throws -> URL {
        return URL(string: url)!
    }
    
    /// Base URL
    var baseURL: String {
        "https://api.coindesk.com"
    }
    
    /// Version
    var version: ApiVersion {
        switch self {
        case .getCurrentPrice:
            return .v1
        }
    }
    
    // URLString
    var url: String {
        switch self {
        case .getCurrentPrice:
            return baseURL + "/\(version.rawValue)" + "/bpi/currentprice.json"
        }
    }
    
    /// Request encoding
    var encoding: ParameterEncoding {
        switch self {
        case .getCurrentPrice:
            return URLEncoding.default
        }
    }
    
    /// Request Header
    var header: HTTPHeaders? {
        switch self {
        case .getCurrentPrice:
            return nil
        }
    }
    
    /// Request Parameter
    var parameter: Parameters? {
        switch self {
        case .getCurrentPrice:
            return nil
        }
    }
    
    /// HTTP Method.
    var method: HTTPMethod {
        switch self {
        case .getCurrentPrice:
            return .get
        }
    }
}


enum ApiVersion: String {
    case v1 = "v1"
}
