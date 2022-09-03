//
//  HomeInteractor.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 4/9/2565 BE.
//

import Foundation


class HomeInteractor: HomeInteracting {
    
    func getCurrentPrice(completion: @escaping (Result<CurrentPriceModel, NetworkError>) -> ()) {
        
        let service = GetCoinListsService()
        service.fetchCoinLists { result in
            switch result {
            case let .success(model):
                completion(.success(model))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    
}
