//
//  ExchangeInteractor.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation


class ExchangeInteractor: ExchangeInteracting {
    
    func getCurrencyLists(completion: @escaping (Result<CurrentPriceModel, NetworkError>) -> ()) {
        
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
