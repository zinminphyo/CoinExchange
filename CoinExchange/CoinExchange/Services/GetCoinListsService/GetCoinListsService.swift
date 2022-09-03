//
//  GetCoinListsService.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 3/9/2565 BE.
//

import Foundation
import Alamofire



struct GetCoinListsService: GetCoinListsServiceProtocol {
    
    
    func fetchCoinLists() {
        let router = ApiRouter.getCurrentPrice
        NetworkService.shared.request(router: router) { (result: Result<CurrentPriceModel,NetworkError>) in
            switch result {
            case .success(let success):
                print("Success \(success)")
            case .failure(let failure):
                print("Failure is \(failure.localizedDescription)")
            }
        }
    }
    
    
}
