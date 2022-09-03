//
//  GetCoinListsServiceProtocol.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation

protocol GetCoinListsServiceProtocol {
    
    typealias onCompletion = (Result<CurrentPriceModel,NetworkError>) -> ()
    func fetchCoinLists(completion: @escaping onCompletion)
}
