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
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else { return }
        AF.request(url)
            .response { response in
                print("response is \(response)")
            }
            .responseDecodable { (response: DataResponse<CurrentPriceModel,AFError>) in
                switch response.result {
                case let .success(model):
                    print("Model is \(model)")
                case let .failure(error):
                    print("error is \(error.localizedDescription)")
                }
            }
    }
    
    
}
