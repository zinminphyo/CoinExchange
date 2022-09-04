//
//  ExchangeInteracting.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import Foundation


protocol ExchangeInteracting {
    func getCurrencyLists(completion: @escaping (Result<CurrentPriceModel,NetworkError>) -> ())
}
