//
//  NetworkService.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation
import Alamofire



class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func request<T: Codable>(router: ApiRouter, completion: @escaping (Result<T,NetworkError>) -> ()) {
        
        
        do  {
            
            let url = try router.asURL()
            AF.request(url, method: router.method, parameters: router.parameter, encoding: router.encoding, headers: router.header)
                .responseDecodable { (response: DataResponse<T,AFError>) in
                    switch response.result {
                    case let .success(result):
                        completion(.success(result))
                    case let .failure(error):
                        switch response.response?.statusCode {
                        case 401:
                            completion(.failure(.unauthorized))
                        case 404:
                            completion(.failure(.notFound))
                        case 500:
                            completion(.failure(.internalServerError))
                        default:
                            completion(.failure(.customError(error)))
                        }
                    }
                }
            
            
        } catch {
            completion(.failure(.customError(error)))
        }
        
        
    }
}
