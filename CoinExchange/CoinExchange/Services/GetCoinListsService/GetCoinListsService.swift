//
//  GetCoinListsService.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation
import Alamofire



struct GetCoinListsService: GetCoinListsServiceProtocol {
    
    func fetchCoinLists(completion: @escaping onCompletion) {
        let router = ApiRouter.getCurrentPrice
        NetworkService.shared.request(router: router) { (result: Result<CurrentPriceModel,NetworkError>) in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    
}
