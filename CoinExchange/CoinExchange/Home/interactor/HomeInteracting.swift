//
//  HomeInteracting.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 4/9/2565 BE.
//

import Foundation


protocol HomeInteracting {
    func getCurrentPrice(completion: @escaping (Result<CurrentPriceModel,NetworkError>) -> ())
}
